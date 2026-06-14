import socket
import pickle

class Student:
    def __init__(self, ime, prezime, broj_indeksa, prosek):
        self.ime = ime
        self.prezime = prezime
        self.broj_indeksa = broj_indeksa
        self.prosek = prosek

    def __str__(self):
        return f"{self.ime} {self.prezime}, {self.broj_indeksa}, {self.prosek}"

def send_object(sock, obj):
    serialized_obj = pickle.dumps(obj)
    sock.sendall(serialized_obj)

def receive_object(sock):
    serialized_obj = sock.recv(1024)
    obj = pickle.loads(serialized_obj)
    return obj

def start_client():
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    host = socket.gethostname()
    port = 1234
    s.connect((host, port))

    ime = input("Unesite ime studenta: ")
    prezime = input("Unesite prezime studenta: ")
    broj_indeksa = input("Unesite broj indeksa studenta: ")
    prosek = float(input("Unesite prosek studenta: "))

    student = Student(ime, prezime, broj_indeksa, prosek)
    send_object(s, student)
    response = s.recv(1024).decode('ascii')

    print(response)

    s.close()

while True:
    start_client()
