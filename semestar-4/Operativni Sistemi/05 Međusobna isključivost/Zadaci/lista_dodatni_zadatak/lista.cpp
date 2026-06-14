/*
Napraviti thread-safe jednostruko spregnutu listu ciji cvorovi sadrze cele brojeve.
Testirati rad liste datim glavnim programom.
*/

#include <iostream>
#include <thread>
#include <mutex>

using namespace std;

struct ListNode
{
    ListNode *next;
    int content;

    ListNode(int c) : content(c), next(nullptr) {}
    ListNode(int c, ListNode *n) : content(c), next(n) {}
};

class LinkedList
{
    ListNode *head;
    mutex m;

    ListNode **get_pointer(int index)
    {
        if (!index || (index < 0 && !head)) return &head;
        ListNode *ptr = head;

        if (index < 0)
        {
            while (ptr->next) ptr = ptr->next;
            return &ptr->next;
        }

        for (int i = 1; i < index && ptr->next; i++) ptr = ptr->next;
        return &ptr->next;
    }

    void deleteElementUnlocked()
    {
        if (head)
        {
            ListNode *ptr = head;
            head = head->next;
            delete ptr;
        }
    }

public:
    LinkedList() : head(nullptr) {}

    void addElement(int content)
    {
        ListNode *node = new ListNode(content);
        unique_lock<mutex> l(m);
        *get_pointer(-1) = node;
    }

    void deleteElement()
    {
        unique_lock<mutex> l(m);
        deleteElementUnlocked();
    }

    void insertElement(int content, int index)
    {
        unique_lock<mutex> l(m);
        ListNode **ptr = get_pointer(index);
        *ptr = new ListNode(content, *ptr);
    }

    ~LinkedList()
    {
        unique_lock<mutex> l(m);
        while (head) deleteElementUnlocked();
    }

    friend ostream &operator<<(ostream &os, LinkedList &list)
    {
        os << "[ ";
        unique_lock<mutex> l(list.m);
        for (ListNode *ptr = list.head; ptr; ptr = ptr->next) os << ptr->content << " ";
        return os << "]";
    }
};

void add(LinkedList& l)
{
    for (int i = 0; i < 10; i++) l.addElement(i);
}

void insert(LinkedList &l)
{
    for (int i = 0; i < 10; i++) l.insertElement(i, rand()%100);
}

void del(LinkedList& l) {
    for (int i = 0; i < 10; i++) l.deleteElement();
}

int main() {
    LinkedList list;
    add(list);

    thread t1(del, ref(list));
    thread t2(del, ref(list));
    t1.join();
    t2.join();

    cout << list << endl;;
}
