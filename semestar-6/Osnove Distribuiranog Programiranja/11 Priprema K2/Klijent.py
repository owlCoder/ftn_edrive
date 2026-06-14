import socket
import pickle

# defisanje klase student
class Student:
    def __init__(self, ime, prezime, broj_indeksa, prosek):
        self.ime = ime
        self.prezime = prezime
        self.broj_indeksa = broj_indeksa
        self.prosek = prosek

    def __str__(self):
        return f'{self.ime} {self.prezime} ({self.broj_indeksa}) - Prosek: {self.prosek}'

# slanje objekta klase student
def send_object(sock, obj):
    serialized_obj = pickle.dumps(obj)
    sock.sendall(serialized_obj)

# prijem objekta klase student
def receive_object(sock):
    serialized_obj = sock.recv(1024)
    obj = pickle.loads(serialized_obj)
    return obj

# funkcija za rad klijenta
def start_client():
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    host = socket.gethostname()
    port = 1234
    s.connect((host, port))
    
    print("\nCRUD Studenti")
    print("\t1 - Dodavanje novog studenta")
    print("\t2 - Citanje studenta")
    print("\t3 - Azuriranje studenta")
    print("\t4 - Brisanje studenta")

    operacija = input("Izbor opcije: ")
    s.send(operacija.encode('ascii'))
    print()
    
    # 1 - DODAVANJE NOVOG STUDENTA
    if operacija == "1":
        ime = input("Unesite ime studenta: ")
        prezime = input("Unesite prezime studenta: ")
        broj_indeksa = input("Unesite broj indeksa studenta: ")
        prosek = float(input("Unesite prosek studenta: "))
        
        student = Student(ime, prezime, broj_indeksa, prosek)
        send_object(s, student)
        response = s.recv(1024).decode('ascii')
        print(response)
    
    # 2 - CITANJE STUDENTA
    elif operacija == "2":
        broj_indeksa = input("Unesite broj indeksa studenta kojeg bi da procitate: ")
        student = Student("", "", broj_indeksa, "")
        send_object(s, student)
        response = s.recv(1024).decode('ascii')
        print(response)
    
    # 3 - AZURIRANJE STUDENTA
    elif operacija == "3":
        ime = input("Unesite novo ime studenta: ")
        prezime = input("Unesite novo prezime studenta: ")
        broj_indeksa = input("Unesite broj indeksa studenta kojeg menjate: ")
        prosek = float(input("Unesite novi prosek studenta: "))
        
        student = Student(ime, prezime, broj_indeksa, prosek)
        send_object(s, student)
        response = s.recv(1024).decode('ascii')
        print(response)
        
    # 4 - BRISANJE STUDENTA
    elif operacija == "4":
        broj_indeksa = input("Unesite broj indeksa studenta za brisanje: ")
        
        student = Student("", "", broj_indeksa, "")
        send_object(s, student)
        response = s.recv(1024).decode('ascii')
        print(response)

    # zatvaranje uticnice
    s.close()

while True:
    start_client()