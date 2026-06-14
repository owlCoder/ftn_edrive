import Student
import socket

# Kreiranje serverske TCP uticnice IPv4 adrese 
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Dobavljanje IP adrese racunara
host   = socket.gethostname()

# Port na kome ce biti otvoren server
port   = 4000

# Povezivanje adrese i porta
server.bind((host, port))

# Prebacivanje servera u rezim osluskivanja klijenata
server.listen()

# Ispis poruke da server pocinje sa radom
print("Server pocinje sa radom...")

# Prihvatanje novog klijenta
klijent, adresa = server.accept()
print("Povezan klijent sa IP %s" % str(adresa))

# Kolekcija podataka u kojoj ce se cuvati studenti
studenti = {}

while True:
    # Klijent unosi operaciju koju zeli
    operacija = klijent.recv(1024).decode()
    
    # Ako nije uneto nista - prekini rad servera
    if not operacija: break
    
    if operacija == "CREATE":
        # Prijem studenta za dodavanje od klijenta
        student = Student.receive_object(klijent)
        
        # Ako student ne postoji - dodajemo ga u recnik
        if student.broj_indeksa not in studenti.keys():
            # Upis novog studenta u recnik
            studenti[student.broj_indeksa] = student
            
            # Slanje poruke klijentu da je dodavanje uspesno
            klijent.send("\nStudent uspesno upisan u bazu podataka!".encode())
        else:
            # Slanje poruke klijentu da student vec postoji
            klijent.send("\nStudent vec postoji u bazi podataka!".encode())
        
    elif operacija == "READ":
        # Prijem broja indeksa studenta za citanje od klijenta
        broj_indeksa = klijent.recv(1024).decode()
        
         # Ako student postoji - string ispis saljemo klijentu
        if broj_indeksa in studenti.keys():
            # Slanje ispisa studenta klijentu
            klijent.send((studenti[broj_indeksa].__str__()).encode())
        else:
            # Slanje poruke klijentu da student ne postoji
            klijent.send("\nStudent ne postoji u bazi podataka!".encode())
            
    elif operacija == "UPDATE":
        # Prijem studenta za izmenu od klijenta
        student = Student.receive_object(klijent)
        
         # Ako student postoji - menjamo ga kljucu u recniku
        if student.broj_indeksa in studenti.keys():
            # Upis novog studenta u recnik
            studenti[student.broj_indeksa] = student
            
            # Slanje poruke klijentu da je azuriranje uspesno
            klijent.send("\nStudent uspesno azuriran u bazi podataka!".encode())
        else:
            # Slanje poruke klijentu da student ne postoji
            klijent.send("\nStudent ne postoji u bazi podataka!".encode())
        
    elif operacija == "DELETE":
        # Prijem broja indeksa studenta za brisanje iz recnika od klijenta
        broj_indeksa = klijent.recv(1024).decode()
        
         # Ako student postoji brisemo ga iz recnika
        if broj_indeksa in studenti.keys():
            # Brisanje studenta iz recnika
            studenti.pop(broj_indeksa)
            
            # Slanje poruke klijentu da je brisanje studenta uspesno
            klijent.send("\nStudent uspesno obrisan iz baze podataka!".encode())
        else:
            # Slanje poruke klijentu da student ne postoji
            klijent.send("\nStudent ne postoji u bazi podataka!".encode())

print("\nServer prestaje sa radom...")
server.close()