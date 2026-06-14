import pickle

# Klasa koja modeluje jednog studenta
class Student:
    # Konstruktor sa parametrima
    def __init__(self, ime, prezime, broj_indeksa, ocene):
        self.ime = ime
        self.prezime = prezime
        self.broj_indeksa = broj_indeksa
        self.ocene = ocene
        self.izracunaj_prosek()
    
    # Metoda za formatirani ispis 
    def __str__(self):
        return f"\n[{self.broj_indeksa}] {self.ime} {self.prezime} - Prosek: {self.prosek}"
    
    # Metoda za racunanje proseka studenta
    def izracunaj_prosek(self):
        self.prosek = sum(self.ocene) / len(self.ocene)


# Metoda za slanje objekta tipa Student
def send_object(socket, student):
    serialized = pickle.dumps(student)
    socket.sendall(serialized)
    
# Metoda za prijem objekta tipa Student
def receive_object(socket):
    serialized = socket.recv(1024)
    student = pickle.loads(serialized)
    
    return student