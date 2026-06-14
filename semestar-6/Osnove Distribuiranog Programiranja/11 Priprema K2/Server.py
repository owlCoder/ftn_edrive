import socket
import pickle

# definicijala klase Student
class Student:
    def __init__(self, ime, prezime, broj_indeksa, prosek):
        self.ime = ime
        self.prezime = prezime
        self.broj_indeksa = broj_indeksa
        self.prosek = prosek

    # metoda ToString()
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

# kolekcija podataka - recnik - studenata
studenti = {
    "123": Student("Filip", "Markovic", "PR122/2020", 8.5),
    "456": Student("Vanja", "Anic", "PR12/2019", 9.0),
    "789": Student("Ivan", "Spanic", "PR41/2020", 7.5)
}

# funkcija za kreiranje servera
def start_server():
    serversocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    host = socket.gethostname()
    port = 1234
    serversocket.bind((host, port))
    serversocket.listen(5)

    while True:
        clientsocket, addr = serversocket.accept()
        print("Povezan klijent sa IP %s" % str(addr))

        # prvo se primi koja operacija se vrsi
        # 1 - dodavanje, 2 - citanje, 3 - update, 4 - brisanje
        operacija = clientsocket.recv(1024).decode('ascii')
        
        # 1 - DODAVANJE NOVOG STUDENTA
        if operacija == "1":
            # prijem studenta za dodavanje
            student = receive_object(clientsocket)
            
            # ako student sa prosledjenim brojem indeksa postoji, ne dodaje se
            if student.broj_indeksa in studenti.keys():
                response = "Student sa brojem indeksa " + student.broj_indeksa + " vec postoji!"
                clientsocket.send(response.encode('ascii'))
            else:
                # student se ne nalazi u kolekciji, pa se dodaje u kolekciju
                studenti[student.broj_indeksa] = student
                
                # slanje poruke klijentu da je dodavanje uspesno
                response = "\nStudent sa brojem indeksa " + student.broj_indeksa + " uspesno dodat!"
                clientsocket.send(response.encode('ascii'))
        
        # 2 - CITANJE STUDENTA
        elif operacija == "2":
            # u novoj poruci prihvata se student koji treba da se procita
            student = receive_object(clientsocket)
            
            # ako indeks postoji, klijentu se kao odgovor vraca student
            if student.broj_indeksa in studenti.keys():
                clientsocket.send(studenti[student.broj_indeksa].__str__().encode('ascii'))
            else:
                # poruka klijentu da nije moguce uraditi citanje studenta koji ne postoji
                response = "\nStudent sa brojem indeksa " + student.broj_indeksa + " ne postoji!"
                clientsocket.send(response.encode('ascii'))
        
        # 3 - AZURIRANJE STUDENTA
        elif operacija == "3":
            # primi se student koji se azurira
            student = receive_object(clientsocket)
            
            # ako student sa brojem indeksa postoji, azurira se
            if student.broj_indeksa in studenti.keys():
                # ukloni studenta iz kolekcije
                studenti[student.broj_indeksa] = student
                
                # ispis poruke klijentu da je azuriranje uspesno
                response = "\nStudent sa brojem indeksa " + student.broj_indeksa + " je uspesno azuriran!"
                clientsocket.send(response.encode('ascii'))
            else:
                # ispis poruke klijentu da je azuriranje neuspesno
                response = "\nStudent sa brojem indeksa " + student.broj_indeksa + " nije uspesno azuriran!"
                clientsocket.send(response.encode('ascii'))
        
        # 4 - BRISANJE STUDENTA
        elif operacija == "4":
            # u novoj poruci prihvata se student koji treba da se obrise
            student = receive_object(clientsocket)
            
            # ako indeks postoji, klijentu se kao odgovor vraca da je student obrisan
            if student.broj_indeksa in studenti.keys():
                # ukloni studenta iz kolekcije
                studenti.pop(student.broj_indeksa)
                
                # slanje poruke klijentu da je student uspesno obrisan
                response = "\nStudent sa brojem indeksa " + student.broj_indeksa + " je uspesno obrisan!"
                clientsocket.send(response.encode('ascii'))
            else:
                # ispis poruke klijentu da je brisanje neuspesno
                response = "\nStudent sa brojem indeksa " + student.broj_indeksa + " ne postoji!"
                clientsocket.send(response.encode('ascii'))
 
        # zatvaranje konekcije ka studentu
        clientsocket.close()
        
        # na serveru ispisati listu studenata nakon izmena
        lista = "\n\nLista studenata: \n"
        for s in studenti.values():
            lista += s.__str__() + "\n"
            
        print(lista)

# pokretanje servera
start_server()