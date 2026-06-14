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

studenti = {
    "123": Student("Marko", "Markovic", "123", 8.5),
    "456": Student("Ana", "Anic", "456", 9.0),
    "789": Student("Ivan", "Ivanovic", "789", 7.5)
}

def send_object(sock, obj):
    serialized_obj = pickle.dumps(obj)
    sock.sendall(serialized_obj)

def receive_object(sock):
    serialized_obj = sock.recv(1024)
    obj = pickle.loads(serialized_obj)
    return obj

def start_server():
    serversocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    host = socket.gethostname()
    port = 1234
    serversocket.bind((host, port))
    serversocket.listen(5)

    while True:
        clientsocket, addr = serversocket.accept()

        print("Povezan klijent sa IP %s" % str(addr))

        student = receive_object(clientsocket)
        if student.broj_indeksa in studenti.keys():
            response = "Student vec postoji!"
        else:
            studenti[student.broj_indeksa] = student
            response = "Lista studenata: \n"
            for s in studenti.values():
                response += s.__str__() + "\n"

        clientsocket.send(response.encode('ascii'))
        clientsocket.close()

start_server()
