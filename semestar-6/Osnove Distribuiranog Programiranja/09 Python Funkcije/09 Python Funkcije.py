# Python funkcije
# 1. Napisati funkciju koja prihvata listu kao parametar i menja je tako što na prvo mesto smešta
# najveći element, a na poslednje najmanji.
lista = [432, 4326, 42, 77, 76, 87, 889, 66]

def MinMaxFunc(lista):
    minimum = min(lista)
    maximum = max(lista)

    lista[0] = maximum
    lista[-1] = minimum

    return None

print("Lista pre", lista)
MinMaxFunc(lista)
print("Lista posle poziva funkcije MinMaxFunc()", lista)

# 2. Napisati funkciju koja može da prima promenljiv broj parametara. Ukoliko je prosleđeno više
# od tri parametra, iz funkcije vratiti njihovu sumu, a u suprotnom vratiti njihov proizvod.
# Pozvati funkciju sa 2 i sa 4 parametra.
def SumaProizvod(*args):
    if len(args) > 3:
        return sum(args)
    else:
        proizvod = 1
        for broj in args:
            proizvod *= broj
        return proizvod

print("SumaProizvod(1, 43) = ", SumaProizvod(1, 43))
print("SumaProizvod(1, 43, 54, 2) = ", SumaProizvod(1, 43, 54, 2))

# 3. Datu listu sortirati numerički. Koristiti ugrađenu funkciju za sortiranje uz odgovarajuću
# lambda funkciju.
# lista = ["10", "2", "19", "0", "-1", "-20", "5"]
lista = ["10", "2", "19", "0", "-1", "-20", "5"]

lista.sort(key=lambda x:int(x))
print(lista)

# 4. Napisati sopstvenu funkciju za filtriranje, koja kao parametre prihvata listu i anonimnu
# funkciju, kojom je određen uslov po kome se filtrira. Pomoću ove funkcije iz date liste
# izdvojiti sve parne brojeve, a zatim i sve negativne.
# lista = [2, 15, -5, 28, 9, -30, 4, -1]
lista = [2, 15, -5, 28, 9, -30, 4, -1]

def filtriranje(lista, funkcija):
    nova = []

    for broj in lista:
        if funkcija(broj):
            nova.append(broj)

    return nova

print(filtriranje(lista, lambda x : (x % 2 == 0)))
print(filtriranje(lista, lambda x : (x < 0)))

# 5. Uvećati svaki element date liste za 10, ali tako da sve vrednosti ostanu stringovi. Koristiti
# ugrađenu funkciju map i odgovarajuću lambda funkciju.
# lista = ["10", "2", "19", "0", "-1", "-20", "5"]
lista = ["10", "2", "19", "0", "-1", "-20", "5"]

rezultat = map(lambda x: int(x) + 10, lista)
print(list(rezultat))


# Klase i objekti
# 1. Napisati klasu za studente FTNa. Neka atribut fakultet bude zajednički za sve instance ove
# klase, a neka se kroz konstruktor inicijalizuju ime, prezime i broj indeksa. Definisati metodu
# koja će prilikom ispisa objekta ispisivati vrednosti ova četiri atributa. Instancirati barem dva
# studenta i ispisati ih.
class Student:
    fakultet = "FTN"
    def __init__(self, ime, prezime, broj_indeksa):
        self.ime = ime
        self.prezime = prezime
        self.broj_indeksa = broj_indeksa

    def __str__(self):
        return f"Ime: {self.ime}, Prezime: {self.prezime}, Broj indeksa: {self.broj_indeksa}, Fakultet: {Student.fakultet}"

student1 = Student("Marko", "Markovic", 1234)
student2 = Student("Petar", "Petrovic", 5678)

print(student1)
print(student2)

# 2. Napisati klasu koja opisuje merenja visine po gradovima u Srbiji. Potrebni atributi su: grad,
# drzava i kolekcija izmerenih vrednosti. Pored metoda za inicijalizaciju i tekstualni prikaz
# objekata, dodati i metodu koja računa prosečnu visinu za svaki grad. Instancirati barem tri
# grada i za svaki ispisati prosečnu visinu.
class Grad:
    def __init__(self, grad, drzava, izmerene_vrednosti):
        self.grad = grad
        self.drzava = drzava
        self.izmerene_vrednosti = izmerene_vrednosti

    def __str__(self):
        return f"Grad: {self.grad}, Drzava: {self.drzava}, Izmerene vrednosti: {self.izmerene_vrednosti}"

    def prosecna_visina(self):
        return sum(self.izmerene_vrednosti) / len(self.izmerene_vrednosti)

beograd = Grad("Beograd", "Srbija", [117, 118, 119])
novi_sad = Grad("Novi Sad", "Srbija", [87, 88, 89])
nis = Grad("Niš", "Srbija", [200, 201, 202])

print(beograd.prosecna_visina())
print(novi_sad.prosecna_visina())
print(nis.prosecna_visina())

# 3. Napisati klasu Ucenik sa poljima: ime, prezime, ocene. Ocene su rečnik, pri čemu je ključ
# naziv predmeta, a vrednost lista ocena iz tog predmeta. Konstruktor kao parametre prihvata
# samo ime i prezime, dok se rečnik popunjava metodom za upis ocena, kojoj se prosleđuje
# predmet i ocena koja se upisuje. Pored ove metode, potrebno je definisati metodu koja
# spram prosleđenog naziva predmeta računa zaključnu ocenu za taj predmet i smešta je u
# novi recnik – zakljucene_ocene. Treća metoda računa prosek učenika spram svih zaključenih
# ocena.
class Ucenik:
    def __init__(self, ime, prezime):
        self.ime = ime
        self.prezime = prezime
        self.ocene = {}

    def upis_ocene(self, predmet, ocena):
        if predmet not in self.ocene:
            self.ocene[predmet] = []
        self.ocene[predmet].append(ocena)

    def zakljucna_ocena(self, predmet):
        return sum(self.ocene[predmet]) / len(self.ocene[predmet])

    def prosek_ucenika(self):
        zakljucene_ocene = {}
        for predmet in self.ocene:
            zakljucene_ocene[predmet] = self.zakljucna_ocena(predmet)
        return sum(zakljucene_ocene.values()) / len(zakljucene_ocene)

ucenik1 = Ucenik("Marko", "Marković")
ucenik1.upis_ocene("Matematika", 5)
ucenik1.upis_ocene("Matematika", 4)
ucenik1.upis_ocene("Fizika", 3)
ucenik1.upis_ocene("Fizika", 4)

print(ucenik1.prosek_ucenika())