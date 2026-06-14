//PR 55/2020 Danijel Jovanovic, Termin vezbi: Pon 17:30. Radjeno: SOV-AB.
//SOV pripremni zadatak, molim pogledajte detalje u priloženim uputstvima
#include <iostream>
#include <cstdlib>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <vector>
#include <list>
#include <random>
#include <chrono>
#include <map>
#include <cstring>
#include <cstdio>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <csignal>
using namespace std;
using namespace chrono;
using namespace this_thread;

typedef chrono::high_resolution_clock hrc_t;	//Radi seed-a PRNG-a.  
typedef uint32_t u32;	//Radi kompaktnosti pisanja
typedef chrono::time_point<chrono::system_clock> accessed_time; // vremenski trenutak

const size_t MEMORY_CAPACITY = (1 << 22);	//4MiB
const hrc_t::time_point start = hrc_t::now();
const chrono::milliseconds stepInterval(100);
const int PROCESSES = 4;

const char *outputName = "stateFifo";
const char *inputName = "commandFifo";

const int EF_FIRSTFIT = 0;
const int EF_LASTFIT = 1;
const int EF_BESTFIT = 2;
const int EF_WORSTFIT = 3;
const int EF_LENGTH = 4;

const int F_ALLOCATING = 1;
const int F_COMPACTING = 2;
const int F_CULLING = 4;

bool allocationEnabled = true;
bool compactingActive = false;
bool lruActive = false;

int type = EF_FIRSTFIT;

// SOV-B
typedef struct
{
	mutex m;
	condition_variable cv;

	accessed_time t;
	u32 identficator;
	u32 process;

	//LRU(accessed_time tt, u32 id, u32 p) : t(tt), identficator(id), process(p) { }
} lru;

lru LRU;

bool lru_compare(accessed_time current) { return current < LRU.t; }

void lru_set_passed(accessed_time tt, u32 id, u32 p) 
{
	LRU.t = tt;
	LRU.identficator = id;
	LRU.process = p;
}

void onAllocationChanged();
void onCompactionChanged();
void onLRUChanged();
void onTypeChanged();

void intHandler(int sig);

mutex mCompaction;
condition_variable cvCompaction;

struct Fragment
{
	//Jedan fragment slobodne memorije
	u32 loc;
	u32 len;
};

class Diagnostics
{
	//Pomoćna klasa, slobodno je proširiti
	private:
		mutex m;
        int fdOutput;
        int fdInput;
        int waiting;
        char outBuffer[8192];
        bool visual;
        char unit;
        u32 pages;
        u32 size;
        u32 contiguous;
        
	public:
		Diagnostics(bool v): waiting(0), visual(v)
		{
			if (visual)
			{
				fdInput = open(inputName, O_RDONLY);
				fdOutput = open(outputName, O_WRONLY);
				*((int*)(outBuffer)) = 3072 + 16;
				outBuffer[4] = type;
				outBuffer[5] = waiting;
				outBuffer[6] = F_ALLOCATING;
				outBuffer[7] = unit;
				*((u32*)(outBuffer + 8)) = pages;
				*((u32*)(outBuffer + 12)) = size;
				*((u32*)(outBuffer + 16)) = contiguous;
				for (int i = 20; i < 3092; i++)
				{
					outBuffer[i] = 0;
				}
				unit = 'b';
				pages = 0;
				size = 0;
				contiguous = 0;
			}
		}

	void reportFreeSpace(u32 newPages, u32 newSize, char newUnit, u32 newContiguous)
	{
		pages = newPages;
		size = newSize;
		unit = newUnit;
		contiguous = newContiguous;
	}

	void incWaiting()
	{
		unique_lock<mutex> l(m);
		waiting++;
	}

	void decWaiting()
	{
		unique_lock<mutex> l(m);
		waiting--;
	}

	int getWaiting() const
	{
		return waiting;
	}

	void allocateMessage(int pid, u32 loc, u32 len, u32 seg)
	{
		unique_lock<mutex> l(m);
		cout << "Process " << pid << " allocating from " << loc << " to " << loc + len << endl;
		if (visual)
		{
			int x = loc / 4096;
			int ll = len / 4096;
			for (int i = 0; i < ll; i++)
			{
				outBuffer[20 + (x + i) *3 + 0] = 1;
				outBuffer[20 + (x + i) *3 + 1] = (char) pid;
				outBuffer[20 + (x + i) *3 + 2] = (char) seg;
			}
		}
	}

	void deallocateMessage(int pid, u32 oLoc, u32 oLen, u32 loc, u32 len)
	{
		unique_lock<mutex> l(m);
		cout << "Process " << pid << " asked to deallocate from " << oLoc << " to " << oLoc + oLen << endl;
		cout << "Process " << pid << " deallocated from " << loc << " to " << loc + len << endl;

		if (visual)
		{
			int x = loc / 4096;
			int ll = len / 4096;
			for (int i = 0; i < ll; i++)
			{
				outBuffer[20 + (x + i) *3 + 0] = 0;
				outBuffer[20 + (x + i) *3 + 1] = 0;
				outBuffer[20 + (x + i) *3 + 2] = 0;
			}
		}
	}

	void compactionDeallocateMessage(u32 oLoc, u32 oLen, u32 loc, u32 len)
	{
		unique_lock<mutex> l(m);
		cout << "The compacter asked to deallocate from " << oLoc << " to " << oLoc + oLen << endl;
		cout << "The compacter deallocated from " << loc << " to " << loc + len << endl;

		if (visual)
		{
			int x = loc / 4096;
			int ll = len / 4096;
			for (int i = 0; i < ll; i++)
			{
				outBuffer[20 + (x + i) *3 + 0] = 0;
				outBuffer[20 + (x + i) *3 + 1] = 0;
				outBuffer[20 + (x + i) *3 + 2] = 0;
			}
		}
	}

	void readMessage(int pid, u32 loc, int seg)
	{
		unique_lock<mutex> l(m);
		cout << "Process " << pid << " reading from location " << loc << " in segment " << seg << endl;
	}

	void writeMessage(int pid, u32 loc, int seg)
	{
		unique_lock<mutex> l(m);
		cout << "Process " << pid << " writing to location " << loc << " in segment " << seg << endl;
	}

	void processStatusMessage(int pid, int seg)
	{
		unique_lock<mutex> l(m);
		cout << "Process " << pid << " has " << seg << " segments." << endl;
	}

	void printFreeMemoryMap(int pid, u32 amount, list<Fragment> &fm)
	{
		unique_lock<mutex> l(m);
		cout << "Process " << pid << " is waiting for " << amount << " bytes, which is " << amount / 4096 << " 4K pages." << endl;
	}

	void compactionMessage(int pid, int seg, u32 oBase, u32 len, u32 nBase)
	{
		unique_lock<mutex> l(m);
		cout << "Process " << pid << " and segment " << seg << "of length " << len << " bytes is a compaction candidate. To be moved from " << oBase << " to " << nBase << endl;
		if (visual)
		{
			int x = nBase / 4096;
			int ll = len / 4096;
			for (int i = 0; i < ll; i++)
			{
				outBuffer[20 + (x + i) *3 + 0] = 1;
				outBuffer[20 + (x + i) *3 + 1] = (char) pid;
				outBuffer[20 + (x + i) *3 + 2] = (char) seg;
			}
		}
	}

	void runOutput()
	{
		while (1 && visual)
		{
			this_thread::sleep_for(stepInterval / 2);
			outBuffer[4] = type;
			outBuffer[5] = waiting;
			outBuffer[6] = 0;
			outBuffer[7] = unit;
			*((u32*)(outBuffer + 8)) = pages;
			*((u32*)(outBuffer + 12)) = size;
			*((u32*)(outBuffer + 16)) = contiguous;
			if (allocationEnabled) outBuffer[6] |= F_ALLOCATING;
			if (compactingActive) outBuffer[6] |= F_COMPACTING;
			if (lruActive) outBuffer[6] |= F_CULLING;
			write(fdOutput, outBuffer, 3092);
		}
	}

	void runInput()
	{
		if (visual)
		{
			while (1)
			{
				char inbuf[2];
				read(fdInput, inbuf, 2);
				if (inbuf[0] == 'q' && inbuf[1] == 'q')
				{
					intHandler(0);
					return;
				}
				else if (inbuf[0] == 'c')
				{
					type = (int) inbuf[1];
					onTypeChanged();
				}
				else if (inbuf[0] == 'a')
				{
					if (inbuf[1] == 0)
					{
						allocationEnabled = false;
					}
					else if (inbuf[2] == 1)
					{
						allocationEnabled = true;
					}
					else
					{
						allocationEnabled = !allocationEnabled;
					}
					onAllocationChanged();
				}
				else if (inbuf[0] == 'd')
				{
					if (inbuf[1] == 0)
					{
						compactingActive = false;
					}
					else if (inbuf[2] == 1)
					{
						compactingActive = true;
					}
					else
					{
						compactingActive = !compactingActive;
					}
					onCompactionChanged();
				}
				else if (inbuf[0] == 'n')
				{
					if (inbuf[1] == 0)
					{
						lruActive = false;
					}
					else if (inbuf[2] == 1)
					{
						lruActive = true;
					}
					else
					{
						lruActive = !lruActive;
					}
					onLRUChanged();
				}
			}
		}
		else
		{
			//Rezervna ne-vizuelna tehnika kontrole
			while (1)
			{
				char c;
				cin >> c;
				if (c == 'q')
				{
					intHandler(0);
					return;
				}
				else if (c == 'c')
				{
					type = (type + 1) % EF_LENGTH;
					{
						unique_lock<mutex> l(m);
						cout << "Mod je sada: " << type << endl;
					}
					onTypeChanged();
				}
				else if (c == 'a')
				{
					allocationEnabled = !allocationEnabled;
					{
						unique_lock<mutex> l(m);
						cout << "Alokacije je sada: " << ((allocationEnabled) ? "ON" : "OFF") << endl;
					}
					onAllocationChanged();
				}
				else if (c == 'd')
				{
					compactingActive = !compactingActive;
					{
						unique_lock<mutex> l(m);
						cout << "Kompakcija je sada: " << ((compactingActive) ? "ON" : "OFF") << endl;
					}
					onCompactionChanged();
				}
				else if (c == 'n')
				{
					lruActive = !lruActive;
					{
						unique_lock<mutex> l(m);
						cout << "LRU je sada: " << ((compactingActive) ? "ON" : "OFF") << endl;
					}
					onLRUChanged();
				}
			}
		}
	}
};

struct TableEntry
{
	//Jedna stavka u tabeli segmenta sa dodatkom tacke
	// u vremenu koja cuva trenutak poslednjeg pristupa
	// koristi se za LRU algoritam
	accessed_time vremenski_pristup = system_clock::now();
	u32 base = 0;
	u32 len = 0;
	int m = -1;
};

struct ReusableMutex
{
	bool taken = false;
	mutex m;
};

class SegmentTable
{
	//Tabela segmenata za neki proces
	public:
		SegmentTable() {}
	int insertSegment(TableEntry tableEntry)
	{
		int id = getNewID();
		table.insert(pair<int, TableEntry> (id, tableEntry));
		return id;
	}
	void deleteSegment(int id)
	{
		table.erase(id);
	}
	TableEntry &getEntry(int id)
	{
		return table[id];
	}
	/*
	    Vraća nasumični validni ID iz date tabele. Nije ključno za rešenje
	    ali čini programiranje procesa lakšim. Prosleđujemo random_engine zato
	    što je njegovo generisanje jako sporo, i stoga ne treba da se pravi tokom
	    izvršavanja programa. Naša arhitektura ovde ima poseban generator za
	    svaki proces budući da generisanje slučajnih brojeva predstavlja operaciju
	    pisanja (menja interno stanje) te stoga se mora ili sinhronizovati ili
	    obezbediti jedan takav po niti. Mi smo uradili ovo drugo, zbog brzine. 
	*/
	int getRandomID(default_random_engine & gen)
	{
		uniform_int_distribution<int> d(0, table.size() - 1);
		int x = d(gen);
		int i = 0;
		for (pair<int, TableEntry> p: table)
		{
			if (i == x)
			{
				return p.first;
			}
			i++;
		}
		cerr << "Random segment generation failed" << endl;
		return 0;
	}
	private:
		map<int, TableEntry> table;
	/*
	    Kod nađe najveći ID date tabele i vrati tu vrednost uvećanu za 1. To
	    garantuje jedinstven ID. 
	*/
	int getNewID()
	{
		if (table.empty()) return 0;
		int id = 0;
		for (pair<int, TableEntry> p: table)
		{
			if (p.first > id) id = p.first;
		}
		return ++id;
	}
	friend class SystemMemory;
};

//Klasa koja simulira OS
class SystemMemory
{
    	private:
            char *mem;
            bool terminal;
            Diagnostics &cadh;
            map<int, SegmentTable> segmentTables;
            list<Fragment> freeMemory;
            mutex mAllocate;
            condition_variable cvFree;
            ReusableMutex mSegments[1024];

	public:
		SystemMemory(size_t capacity, Diagnostics &d): terminal(false), cadh(d)
		{
			mem = (char*) malloc(capacity);
			if (mem == NULL)
			{
				perror("Could not initialize memory.");
				exit(1);
			}
			//Na početku je sva memorija slobodna što znači da se naša evidencija
			//slobodne memorije od 1 odsečka koji počinje od 0 i veliki je
			//koliko uopšte ima memorije. 
			freeMemory.push_back((Fragment)
			{.loc = 0, .len = (u32) capacity });
		}~SystemMemory()
		{
			free(mem);	//Moramo osloboditi zauzeto
		}

	//Operacija čitanja. Primetite adresu koja je segment + logička adresa
	char read(int processID, int segmentID, u32 logicalAddress)
	{
		unique_lock<mutex> l(mSegments[segmentTables[processID].getEntry(segmentID).m].m);
		segmentTables[processID].getEntry(segmentID).vremenski_pristup = system_clock::now(); // pristup je zabelezen
		cadh.readMessage(processID, logicalAddress, segmentID);	//Ispisuje na ekran
		int loc = segmentTables[processID].getEntry(segmentID).base;
		if (logicalAddress >= segmentTables[processID].getEntry(segmentID).len)
		{
			//Provera prava pristupa
			cerr << "Internal segmentation violation." << endl;
			exit(2);
		}
		return mem[loc + logicalAddress];	//Očitavanje vrednosti uz translaciju
	}
	void write(int processID, int segmentID, u32 logicalAddress, char value)
	{
		unique_lock<mutex> l(mSegments[segmentTables[processID].getEntry(segmentID).m].m);
		segmentTables[processID].getEntry(segmentID).vremenski_pristup = system_clock::now(); // pristup je zabelezen
		cadh.writeMessage(processID, logicalAddress, segmentID);
		int loc = segmentTables[processID].getEntry(segmentID).base;
		if (logicalAddress >= segmentTables[processID].getEntry(segmentID).len)
		{
			cerr << "Internal segmentation violation." << endl;
			exit(2);
		}
		mem[loc + logicalAddress] = value;
	}

	int allocate(int processID, u32 amount)
	{
		if (!segmentTables.count(processID))
		{
			//U slučaju da ovo zovemo prvi put za dati proces, ubacujemo novu tabelu
			{
				unique_lock<mutex> l(mAllocate);
				segmentTables.insert(pair<int, SegmentTable> (processID, SegmentTable()));
			}	//Ubacivanje menja deljenu klasu te je stavljamo u isključiv region.
			int loc = -1;
			{
				unique_lock<mutex> l(mAllocate);	//I ovde zaključavamo: rad sa evidencijom slobodne memorije je takođe rad sa deljenim resursom
				while ((loc = findFree(amount)) < 0)
				{
					cadh.printFreeMemoryMap(processID, amount, freeMemory);	//U slučaju čekanja pišemo kako trenutno izgleda memorija.
					cadh.incWaiting();
					cvFree.wait(l);
					cadh.decWaiting();
					if (terminal) return -1;	//Proveravamo da li nas je probudio ne uspeh u alokaciji, no proces gašenja.
				}
			}
			//Sada kada imamo odakle počinje naša slobodna memorija (u loc) napravimo segment i stavimo ga u evidenciju
			int ret = segmentTables[processID].insertSegment((TableEntry)
			{.vremenski_pristup=system_clock::now(), .base = (u32) loc, .len = amount, .m = getFreeMutex() });
			cadh.allocateMessage(processID, (u32) loc, amount, ret);
			return ret;	//Vraćamo indeks segmenta koji smo alocirali
		}
		else
		{
			//Isto kao gore, ali bez potrebe da ubacijemo tabelu budući da već postoji
			int loc = -1;
			{
				unique_lock<mutex> l(mAllocate);
				while ((loc = findFree(amount)) < 0)
				{
					cadh.printFreeMemoryMap(processID, amount, freeMemory);
					cadh.incWaiting();
					cvFree.wait(l);
					cadh.decWaiting();
					if (terminal) return -1;
				}
			}
            // SOV-A
            find_sum_of_free_memory();

			int ret = segmentTables[processID].insertSegment((TableEntry)
			{.vremenski_pristup = system_clock::now(), .base = (u32) loc, .len = amount, .m = getFreeMutex() });
			cadh.allocateMessage(processID, (u32) loc, amount, ret);

			return ret;
		}
	}
	void deallocate(int processID, int segmentID)
	{
		int loc = segmentTables[processID].getEntry(segmentID).base;
		int len = segmentTables[processID].getEntry(segmentID).len;
		{
			unique_lock<mutex> l(mAllocate);
			unique_lock<mutex> ll(mSegments[segmentTables[processID].getEntry(segmentID).m].m);
			list<Fragment>::iterator it;
			/*
			    Ovde se implementira algoritam koji smo diskutovali
			    na času. Ako oslobađamo regione fizičke memorije
			    bitno je detektovati situaciju gde imamo fizičke regione
			    koji se dodiruju, budući da njih treba spojiti. 
			    Ako je novoslobođeni segment *, a stari slobodni segmenti
			    #, dok su zauzeti delovi predstavljeni praznim prostorom
			    naše opcije su
			    ###### ****######## prelazi u ###### **** ########
			    ######**** ######## prelazi u ##########  ########
			    ######  ****######## prelazi u ######  ************
			    ######******######## prelazi u ####################
			*/
			for (it = freeMemory.begin(); it != freeMemory.end(); it++)
			{
				if (it->loc > loc) break;
			}
			if (it == freeMemory.begin())
			{
				freeMemory.push_front((Fragment)
				{.loc = (u32) loc, .len = (u32) len });
				it = freeMemory.begin();
				list<Fragment>::iterator next = it;
				next++;
				if (next != freeMemory.end())
				{
					if (it->loc + it->len == next->loc)
					{
						it->len = it->len + next->len;
						freeMemory.erase(next);
						cadh.deallocateMessage(processID, (u32) loc, len, (u32) loc, it->len);
						cvFree.notify_all();
					}
					else
					{
						cadh.deallocateMessage(processID, (u32) loc, len, (u32) loc, len);
						cvFree.notify_all();
					}
				}
				else
				{
					cadh.deallocateMessage(processID, (u32) loc, len, (u32) loc, len);
					cvFree.notify_all();
				}
			}
			else
			{
				it--;
				if ((it->loc + it->len) == loc)
				{
					it->len = it->len + len;
					list<Fragment>::iterator next = it;
					next++;
					if (next != freeMemory.end())
					{
						if (it->loc + it->len == next->loc)
						{
							it->len = it->len + next->len;
							freeMemory.erase(next);
							cadh.deallocateMessage(processID, loc, len, it->loc, it->len);
							cvFree.notify_all();
						}
						else
						{
							cadh.deallocateMessage(processID, loc, len, it->loc, it->len);
							cvFree.notify_all();
						}
					}
					else
					{
						cadh.deallocateMessage(processID, loc, len, it->loc, it->len);
						cvFree.notify_all();
					}
				}
				else
				{
					it++;
					it = freeMemory.insert(it, (Fragment)
					{.loc = (u32) loc, .len = (u32) len });
					list<Fragment>::iterator next = it;
					next++;
					if (next != freeMemory.end())
					{
						if (it->loc + it->len == next->loc)
						{
							it->len = it->len + next->len;
							freeMemory.erase(next);

                            
							cadh.deallocateMessage(processID, loc, len, it->loc, it->len);
							cvFree.notify_all();
						}
						else
						{
							cadh.deallocateMessage(processID, loc, len, it->loc, it->len);
							cvFree.notify_all();
						}
					}
					else
					{
						cadh.deallocateMessage(processID, loc, len, it->loc, it->len);
						cvFree.notify_all();
					}
				}
			}

            // SOV-A
            find_sum_of_free_memory();
            
			mSegments[segmentTables[processID].getEntry(segmentID).m].taken = false;
			segmentTables[processID].deleteSegment(segmentID);

            
		}
	}
	//Ovo je ono što u stvari zove proces, ovo ga samo usmeri gde treba
	int getRandomID(int processID, default_random_engine &gen)
	{
		return segmentTables[processID].getRandomID(gen);
	}
	//Ovim zaustavljamo niti koje čekaju u okviru OS. 
	void terminate()
	{
		terminal = true;
		cvFree.notify_all();
		cvCompaction.notify_all();
	}
	void compactionProcess()
	{
		bool foundCandidate = false;
		int cProcess = -1;
		int cSegment = -1;
		int cSegmentM = -1;
		Fragment target;
		{
			unique_lock<mutex> l(mAllocate);
			for (pair<int, SegmentTable> p: segmentTables)
			{
				for (pair<int, TableEntry> pp: p.second.table)
				{
					int inefficiency = 0;
					int gapBack = 0;
					int gapForward = 0;
					int targetInefficiency = MEMORY_CAPACITY;
					list<Fragment>::iterator it = freeMemory.begin();
					list<Fragment>::iterator targetFragment = freeMemory.begin();
					for (Fragment f: freeMemory)
					{
						if (((int) f.len - (int) pp.second.len) < targetInefficiency && ((int) f.len - (int) pp.second.len) > 0)
						{
							targetInefficiency = (int) f.len - (int) pp.second.len;
							targetFragment = it;
						}
						if (f.loc + f.len == pp.second.base)
						{
							gapBack = f.len;
						}
						else if (f.loc + f.len == pp.second.base + pp.second.len)
						{
							gapForward = f.len;
						}
						it++;
					}
					inefficiency = gapBack + gapForward;
					if (inefficiency > targetInefficiency + 8192)
					{
						if (targetFragment->len == pp.second.len)
						{
							target = *targetFragment;
							freeMemory.erase(targetFragment);
							foundCandidate = true;
							cProcess = p.first;
							cSegment = pp.first;
							cSegmentM = pp.second.m;
							mSegments[pp.second.m].m.lock();
							break;
						}
						else
						{
							target = *targetFragment;
							target.len = pp.second.len;
							targetFragment->len -= pp.second.len;
							targetFragment->loc += pp.second.len;
							foundCandidate = true;
							cProcess = p.first;
							cSegment = pp.first;
							cSegmentM = pp.second.m;
							mSegments[pp.second.m].m.lock();
							break;
						}
					}
					if (foundCandidate) break;
				}
				if (foundCandidate) break;
			}
		}
		if (foundCandidate)
		{
			this_thread::sleep_for(chrono::milliseconds(50));
			TableEntry *te = &((segmentTables[cProcess]).table[cSegment]);
			cadh.compactionMessage(cProcess, cSegment, te->base, te->len, target.loc);
			for (int i = 0; i < te->len; i++)
			{
				mem[target.loc + i] = mem[te->base + i];
			}
			int loc = te->base;
			int len = te->len;
			te->base = target.loc;
			mSegments[cSegmentM].m.unlock();
			{
				unique_lock<mutex> l(mAllocate);
				list<Fragment>::iterator it;
				/*
				    Ovde se implementira algoritam koji smo diskutovali
				    na času. Ako oslobađamo regione fizičke memorije
				    bitno je detektovati situaciju gde imamo fizičke regione
				    koji se dodiruju, budući da njih treba spojiti. 
				    Ako je novoslobođeni segment *, a stari slobodni segmenti
				    #, dok su zauzeti delovi predstavljeni praznim prostorom
				    naše opcije su
				    ###### ****######## prelazi u ###### **** ########
				    ######**** ######## prelazi u ##########  ########
				    ######  ****######## prelazi u ######  ************
				    ######******######## prelazi u ####################
				*/
				for (it = freeMemory.begin(); it != freeMemory.end(); it++)
				{
					if (it->loc > loc) break;
				}
				if (it == freeMemory.begin())
				{
					freeMemory.push_front((Fragment)
					{.loc = (u32) loc, .len = (u32) len });
					it = freeMemory.begin();
					list<Fragment>::iterator next = it;
					next++;
					if (next != freeMemory.end())
					{
						if (it->loc + it->len == next->loc)
						{
							it->len = it->len + next->len;
							freeMemory.erase(next);
							cadh.compactionDeallocateMessage((u32) loc, len, (u32) loc, it->len);
							cvFree.notify_all();
						}
						else
						{
							cadh.compactionDeallocateMessage((u32) loc, len, (u32) loc, len);
							cvFree.notify_all();
						}
					}
					else
					{
						cadh.compactionDeallocateMessage((u32) loc, len, (u32) loc, len);
						cvFree.notify_all();
					}
				}
				else
				{
					it--;
					if ((it->loc + it->len) == loc)
					{
						it->len = it->len + len;
						list<Fragment>::iterator next = it;
						next++;
						if (next != freeMemory.end())
						{
							if (it->loc + it->len == next->loc)
							{
								it->len = it->len + next->len;
								freeMemory.erase(next);
								cadh.compactionDeallocateMessage(loc, len, it->loc, it->len);
								cvFree.notify_all();
							}
							else
							{
								cadh.compactionDeallocateMessage(loc, len, it->loc, it->len);
								cvFree.notify_all();
							}
						}
						else
						{
							cadh.compactionDeallocateMessage(loc, len, it->loc, it->len);
							cvFree.notify_all();
						}
					}
					else
					{
						it++;
						it = freeMemory.insert(it, (Fragment)
						{.loc = (u32) loc, .len = (u32) len });
						list<Fragment>::iterator next = it;
						next++;
						if (next != freeMemory.end())
						{
							if (it->loc + it->len == next->loc)
							{
								it->len = it->len + next->len;
								freeMemory.erase(next);
								cadh.compactionDeallocateMessage(loc, len, it->loc, it->len);
								cvFree.notify_all();
							}
							else
							{
								cadh.compactionDeallocateMessage(loc, len, it->loc, it->len);
								cvFree.notify_all();
							}
						}
						else
						{
							cadh.compactionDeallocateMessage(loc, len, it->loc, it->len);
							cvFree.notify_all();
						}
					}
				}
			}
		}
	}

	void compactionRunner()
	{
		while (1)
		{
		{ 	unique_lock<mutex> l(mCompaction);
				while (!compactingActive)
				{
					cvCompaction.wait(l);
				}
				if (terminal) return;
			}
			compactionProcess();
			this_thread::sleep_for(chrono::milliseconds(10));
		}
	}

	int getFreeMutex()
	{
		for (int i = 0; i < 1024; i++)
		{
			if (!mSegments[i].taken) return i;
		}
		return -1;
	}

	/*
	    Implementacija first fit algoritma. Prvi odsečak koji je dovoljno veliki
	    se odabira. Ako je taman veličine ceo se izvozi. Ako je veći, mrvi se
	    tako što se početak odsečka pomera unapred za zauzet prostor i dužina
	    se adekvatno smanjuje, a kao povratna vrednost se daje pređašnja adresa
	    početka tog odsečka. 
	*/
	int findFree(u32 amount)
	{
		if (type == EF_FIRSTFIT)
		{
			for (list<Fragment>::iterator it = freeMemory.begin(); it != freeMemory.end(); it++)
			{
				if (it->len == amount)
				{
					int ret = (int) it->loc;
					freeMemory.erase(it);
					return ret;
				}
				else if (it->len > amount)
				{
					int ret = (int) it->loc;
					it->loc = it->loc + amount;
					it->len = it->len - amount;
					return ret;
				}
			}
		}
		else if (type == EF_LASTFIT)
		{
			for (list<Fragment>::reverse_iterator it = freeMemory.rbegin(); it != freeMemory.rend(); it++)
			{
				if (it->len == amount)
				{
					int ret = (int) it->loc;
					freeMemory.erase(std::next(it).base());
					return ret;
				}
				else if (it->len > amount)
				{
					int ret = (int) it->loc;
					it->loc = it->loc + amount;
					it->len = it->len - amount;
					return ret;
				}
			}
		}
		else if (type == EF_BESTFIT)
		{
			list<Fragment>::iterator best = freeMemory.begin();
			for (list<Fragment>::iterator it = freeMemory.begin(); it != freeMemory.end(); it++)
			{
				long odiff = (long) best->len - (long) amount;
				long diff = (long) it->len - (long) amount;
				if ((diff < odiff) && (diff >= 0))
				{
					best = it;
				}
				else if ((odiff < 0) && (diff >= 0))
				{
					best = it;
				}
			}
			if (best->len == amount)
			{
				int ret = (int) best->loc;
				freeMemory.erase(best);
				return ret;
			}
			else if (best->len > amount)
			{
				int ret = (int) best->loc;
				best->loc = best->loc + amount;
				best->len = best->len - amount;
				return ret;
			}
		}
		else if (type == EF_WORSTFIT)
		{
			list<Fragment>::iterator best = freeMemory.begin();
			for (list<Fragment>::iterator it = freeMemory.begin(); it != freeMemory.end(); it++)
			{
				long odiff = (long) best->len - (long) amount;
				long diff = (long) it->len - (long) amount;
				if ((diff > odiff) && (diff >= 0))
				{
					best = it;
				}
			}
			if (best->len == amount)
			{
				int ret = (int) best->loc;
				freeMemory.erase(best);
				return ret;
			}
			else if (best->len > amount)
			{
				int ret = (int) best->loc;
				best->loc = best->loc + amount;
				best->len = best->len - amount;
				return ret;
			}
		}
		return -1;
	}

    // SOV-A
    void find_sum_of_free_memory()
    {
        //unique_lock<mutex> l(mAllocate); // free memory je deljeni resurs? 
        u32 suma = 0;
        auto najvise = freeMemory.cbegin();

        for(auto it = freeMemory.cbegin(); it != freeMemory.cend(); it++)
        {
            // prolazimo kroz celu listu slobodne memorije i sumiramo
            suma += it -> len;

            // potrebno je pronaci max deo slobodne kontinualne memorije
            if(it -> len > najvise -> len)
                najvise = it;
        }

        u32 bajts = suma;
        suma /= 4096; // moze i MEMORY_CAPACITY
        char jedinica_mere;

        if(bajts < 1024) 
            jedinica_mere = 'B';
        else if(bajts >= 1024 && bajts <= 1048576) 
            jedinica_mere = 'K', bajts /=  1024;
        else if(bajts > 1048576)
            jedinica_mere = 'M', bajts /= 1048576;

        cadh.reportFreeSpace(suma, bajts, jedinica_mere, (najvise -> len) / 4096);
    }

	// SOV-B
	void least_recenty_used()
	{
		unique_lock<mutex> lock(LRU.m);

		for(; ;) // vrteti sve u beskonacnoj petlji
		{
			sleep_for(milliseconds(30));

			while(!lruActive) LRU.cv.wait(lock);

			if(cadh.getWaiting() == PROCESSES)
			{
				lru_set_passed(	segmentTables[0].table.begin() -> second.vremenski_pristup,
							    segmentTables[0].table.begin() -> first,
							    0
							  );

				for(int i = 0; i < PROCESSES; i++)
				{
					auto it_i = segmentTables[i].table.begin();
					auto it_j = segmentTables[i].table.end();

					while (it_i != it_j)
					{
						if(lru_compare(it_i -> second.vremenski_pristup))
						{
							lru_set_passed( segmentTables[i].table.begin() -> second.vremenski_pristup,
							   				segmentTables[i].table.begin() -> first,
							    			i
							  );
						}

						it_i++;
					}
					deallocate(LRU.process, LRU.identficator);
					cvFree.notify_one();
				}
			}
			else if(terminal)
			{
				return;
			}
		}
	}
    
};

//Sinhronizovani brojač da bi procesi dobili ID brojeve koji su jedinstveni
class IDManager
{
	private:
		int process;
	mutex m;
	public:
		IDManager(): process(0) {}
	int getProcessID()
	{
		unique_lock<mutex> l(m);
		return process++;
	}
};

class Process
{
	public:
		Process(IDManager &idm, SystemMemory &sm, Diagnostics &dd): systemMemory(sm), segmentSizeDistribution(1, 25), stepDistribution(1, 100), terminate(false), cadh(dd)
		{
			id = idm.getProcessID();
			hrc_t::duration d = hrc_t::now() - start;
			auto x = d.count();
			x = x ^ (id << 7);	//Dozvoljavamo bitovima id-a da utiču na seed vrednost
			//generatora slučajnih brojeva ovog procesa. Ovo omogućava da slučajne
			//vrednosti budu maksimalno različite čak i ako su početna vremena veoma
			//bliska. 
			generator.seed(x);
		}
	void run()
	{
		cout << "Running process with ID" << id << endl;
		//Pravljenje početnog, permanentnog segmenta. 
		u32 amount = segmentSizeDistribution(generator) *4096;
		int permanentSegment = systemMemory.allocate(id, amount);
		localTable.insert(pair<int, u32> (permanentSegment, amount));
		while (1)
		{
			if (terminate) return;
			int step = stepDistribution(generator);	//Vrednost od 1 do 100
			//Što nam omogućava da precizno definišemo šanse za različite
			//korake simulacije. 
			if (step < 7)
			{
				if (!allocationEnabled) continue;
				//Veličina za alokaciju koja je umnožak 4096. 
				u32 amount = segmentSizeDistribution(generator) *4096;
				int seg = systemMemory.allocate(id, amount);
				if (seg < 0)
				{
					//Dobijamo -1 samo ako je neko pozvao terminate dok
					//smo mi čekali. 
					terminate = true;
					continue;
				}
				localTable.insert(pair<int, u32> (seg, amount));
			}
			else if (step >= 7 && step < 10)
			{
				int seg = systemMemory.getRandomID(id, generator);
				if (seg == permanentSegment) continue;	//Ne dozvoljavamo
				//da se oslobodi permanentni segment
				systemMemory.deallocate(id, seg);
				localTable.erase(seg);
			}
			else if (step >= 10 && step < 80)
			{
				int seg = systemMemory.getRandomID(id, generator);
				uniform_int_distribution<u32> sd(0, localTable[seg] - 1);
				u32 logicalAddress = sd(generator);
				systemMemory.read(id, seg, logicalAddress);
			}
			else if (step >= 80 && step < 101)
			{
				int seg = systemMemory.getRandomID(id, generator);
				uniform_int_distribution<u32> sd(0, localTable[seg] - 1);
				uniform_int_distribution<int> dd(-1000000, 1000000);
				u32 logicalAddress = sd(generator);
				int data = dd(generator);
				systemMemory.write(id, seg, logicalAddress, data);
			}
			else
			{
				cerr << "Impossible step value" << endl;
				exit(3);
			}
			cadh.processStatusMessage(id, localTable.size());
			this_thread::sleep_for(stepInterval);
		}
	}
	void doTerminate()
	{
		terminate = true;
	}
	private:
		int id;
        Diagnostics &cadh;
        default_random_engine generator;
        SystemMemory &systemMemory;
        map<int, u32> localTable;
        uniform_int_distribution<int> segmentSizeDistribution;
        uniform_int_distribution<int> stepDistribution;
        bool terminate;
};

//Nit koja omogućava da se proces izvršava
void processRunner(Process &p)
{
	p.run();
}

void inputRunner(Diagnostics &d)
{
	d.runInput();
}

void outputRunner(Diagnostics &d)
{
	d.runOutput();
}

//Globalni pokazivači da bi mogli da pristupimo ključnim strukturama programa iz
//Obrađivača signala. 
SystemMemory *pMem = NULL;
Process *processes = NULL;

//Obrađivač signala koji se poziva kada se pritisne CTRL+C
void intHandler(int sig)
{
	cout << "Terminating all threads... " << endl;
	if (pMem == NULL) exit(10);
	if (processes == NULL) exit(11);
	pMem->terminate();
	for (int i = 0; i < PROCESSES; i++)
	{
		processes[i].doTerminate();
	}
}

void onAllocationChanged()
{

}

void onCompactionChanged()
{
	unique_lock<mutex> l(mCompaction);
	cvCompaction.notify_one();
}

void onTypeChanged() 
{
    
}

void onLRUChanged() 
{
    if(lruActive)
	{
		unique_lock<mutex> lock(LRU.m);
		LRU.cv.notify_one();
	}
}

void compactionRunner(SystemMemory & sysmem)
{
	sysmem.compactionRunner();
}

void LRURunner(SystemMemory &sm)
{
	sm.least_recenty_used();
}

int main(int argc, char **argv)
{
	bool visual = true;
	if (argc == 2)
	{
		if (argv[1][0] == 't')
		{
			visual = false;
		}
	}
	Diagnostics d(visual);
	SystemMemory mem(MEMORY_CAPACITY, d);
	pMem = &mem;
	signal(SIGINT, intHandler);
	IDManager idm;
	thread inThread(inputRunner, ref(d));
	thread outThread(outputRunner, ref(d));
	thread compactionThread(compactionRunner, ref(mem));
	thread LRUThread(LRURunner, ref(mem));

	compactionThread.detach();
	LRUThread.detach();
	inThread.detach();
	outThread.detach();
	
	Process processList[PROCESSES]
	{
		Process(idm, mem, d), Process(idm, mem, d), Process(idm, mem, d), Process(idm, mem, d)
	};
	thread threadList[PROCESSES];

	for (int i = 0; i < PROCESSES; i++)
	{
		threadList[i] = thread(processRunner, ref(processList[i]));
	}

	processes = processList;
	
    for (int i = 0; i < PROCESSES; i++)
	{
		threadList[i].join();
	}

	return 0;
}
