import Student
import socket

# Kreiranje serverske TCP uticnice IPv4 adrese 
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Dobavljanje IP adrese racunara
host   = socket.gethostname()

# Port na kome ce biti otvoren server
port   = 4000

# Povezivanje klijenta na server
server.connect((host, port))

while True:
    # Ispis mogucih opcija korisniku
    print("\nDistribuirani sistem studentske sluzbe - CRUD Studenti")
    print("\tCREATE - Dodavanje novog studenta")
    print("\tREAD   - Citanje studenta")
    print("\tUPDATE - Azuriranje studenta")
    print("\tDELETE - Brisanje studenta")
    operacija = input("\nIzbor opcije\n>> ").upper()
    
    # Ako korisnik nije uneo nista - kraj rada programa
    if not operacija: break
    
    server.send(operacija.encode())
    print()
    
    if operacija == "CREATE":
        # Unos podataka o studentu
        ime = input("Unesite ime studenta: ")
        prezime = input("Unesite prezime studenta: ")
        broj_indeksa = input("Unesite broj indeksa studenta: ")
        ocene = input("Unesite ocene studenta razdvojene razmakom: ")
        ocene = list(map(int, ocene.split(' ')))
        
        # Kreiranje novog studenta od unetih podataka i slanje na server
        Student.send_object(server, Student.Student(ime, prezime, broj_indeksa, ocene))
        
        # Prijem poruke od servera da li je student uspesno dodat
        print(server.recv(1024).decode().upper())
        
    elif operacija == "READ":
        # Klijent unosi zeljeni broj indeksa
        broj_indeksa = input("Unesite broj indeksa studenta za citanje: ")

        # Slanje broja indeksa na server studenta koji se trazi
        server.send(broj_indeksa.encode())
        
        # Prijem poruke od servera da li je student uspesno procitan
        print(server.recv(1024).decode().upper())

    elif operacija == "UPDATE":
        # Unos podataka o studentu
        ime = input("Unesite novo ime studenta: ")
        prezime = input("Unesite novo prezime studenta: ")
        broj_indeksa = input("Unesite broj indeksa studenta kojeg menjate: ")
        ocene = input("Unesite nove ocene studenta razdvojene razmakom: ")
        ocene = list(map(int, ocene.split(' ')))
        
        # Kreiranje novog studenta od unetih podataka i slanje na server
        Student.send_object(server, Student.Student(ime, prezime, broj_indeksa, ocene))
        
        # Prijem poruke od servera da li je student uspesno izmenjen
        print(server.recv(1024).decode().upper())
        
    elif operacija == "DELETE":
        # Klijent unosi zeljeni broj indeksa
        broj_indeksa = input("Unesite broj indeksa studenta za brisanje: ")

        # Slanje broja indeksa studenta za brisanje na server
        server.send(broj_indeksa.encode())
        
        # Prijem poruke od servera da li je student uspesno izbrisan
        print(server.recv(1024).decode().upper())
        
# Zatvaranje konekcije sa serverom
print("Konekcija sa serverom se zatvara...")
server.close()