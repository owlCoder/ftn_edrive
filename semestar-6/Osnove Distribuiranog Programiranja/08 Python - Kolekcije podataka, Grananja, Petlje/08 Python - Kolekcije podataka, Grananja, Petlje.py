# ZADACI STRANA 20
# Data je lista:
# lista = ["jabuke", "banane", "kivi", "mandarine", "grozdje", "mango"]

# 1. Ispiši drugi element.
lista = ["jabuke", "banane", "kivi", "mandarine", "grozdje", "mango"]
print(lista[1])

# 2. Promeni treći element na “kupine”.
lista[2] = "kupine"
print(lista)

# 3. Dodaj vrednost “narandže” na kraj liste.
lista.append("narandze")
print(lista)

# 4. Ubaci vrednost “limun” na indeks 2.
lista.insert(2, "limun")
print(lista)

# 5. Ukloni vrednost “mandarine” iz liste.
lista.remove("mandarine")
print(lista)

# 6. Ispiši elemente od drugog zaključno sa petim.
print(lista[1:5])

# 7. Ispiši poslednji element liste.
print(lista[-1])

# 8. Ispiši dužinu liste.
print(len(lista))

# 9. Sortiraj listu.
lista.sort()
print(lista)

# 10. Obriši promenljivu lista.
del lista

# ZADACI STRANA 23
# Data je torka:
# torka = ("jabuke", "banane", "kivi", "mandarine", "grozdje", "mango")

# 1. Ispiši prva četiri elementa.
torka = ("jabuke", "banane", "kivi", "mandarine", "grozdje", "mango")
print(torka[:4])

# 2. Ispiši poslednja dva elementa.
print(torka[-2:])

# 3. Kreiraj promenljivu za vrednost “mango” i promenljivu koja će sadržati sve ostale vrednosti
# torke.
(*ostalo, mango) = torka
print(mango)
print(ostalo)

# ZADACI STRANA 25
# Dat je skup:
# skup = {"jabuke", "banane", "kivi", "mandarine", "grozdje", "mango"}

# 1. Dodaj vrednost “narandze”.
skup = {"jabuke", "banane", "kivi", "mandarine", "grozdje", "mango"}
skup.add("narandze")
print(skup)

# 2. Dodaj skupu sledeću listu: [“visnje”, “jagode”, “maline”, “kupine”].
novi_skup = {"visnje", "jagode", "maline", "kupine"}
skup.update(novi_skup)
print(skup)

# 3. Tražiti od korisnika da unese vrednost koju želi da ukloni iz skupa. 
# Brisanje izvršiti tako da
# program ne izbaci grešku ukoliko je korisnik uneo nepostojeću vrednost.
print("Unesite koju vrednost zelite da uklonite iz skupa")
print(skup)
unos = input()
skup.discard(unos) 
print(skup)

# ZADACI STRANA 28
# Dat je rečnik:
# recnik = {
#  "marka": "Ford",
#  "model": "Mustang",
#  "godina": 1964
# }

# 1. Ispiši vrednost pod ključem “model” na oba načina.
recnik = {
 "marka": "Ford",
 "model": "Mustang",
 "godina": 1964
}
print(recnik["model"])
print(recnik.get("model"))

# 2. Promeni vrednost pod ključem “godina” na 2003.
recnik["godina"] = 2003
print(recnik)

# 3. Dodaj novi par ključ- vrednost koji će definisati da je boja žuta.
recnik["boja"] = "zuta"
print(recnik)

# 4. Obrisati ključ “marka” iz rečnika.
del recnik["marka"]
print(recnik)

# 5. Obrisati sve parove ključ-vrednost iz rečnika.
recnik.clear()
print(recnik)

# ZADACI STRANA 30
# 1. Tražiti od korisnika da unese neki broj. Ukoliko je taj broj manji od 0, ispiši “Uneli ste
# negativni broj.”
print("Unesite broj: ")
unos = int(input())

if(unos < 0):
    print("Uneli ste negativan broj")

# 2. Tražiti od korisnika da unese dva broja i sačuvati ih u promenljive a i b. 
# Skraćenim zapisom ifelse strukture ispisati onaj broj koji je veći, odnosno poruku da su jednaki ukoliko je to slučaj.
print("Unesite dva broja: ")
a = int(input())
b = int(input())

print(a) if a > b else print(b)

# 3. Kreirati listu povrća, a zatim proveriti da li se “krompir” nalazi u listi. Ukoliko se nalazi,
# ispisati odgovarajuću poruku, a ukoliko se ne nalazi, proveriti da li se “grasak” nalazi u listu.
# Opet, ukoliko se nalazi, ispisati odgovarajuću poruku, a ukoliko se ne nalazi ispisati “Vreme je
# za nabavku.”
povrce = ["rotkvica", "krompir", "kupus", "paradajz"]
postoji = False

for p in povrce:
    if p == "krompir":
        print("Postoji krompir u listi!")
    elif p == "grasak":
        postoji = True

if(postoji == False):
    print("Vreme je za nabavku!")

# ZADACI STRANA 32

# 1. Kreirati listu brojeva i pomoću for petlje ispisati svaki od njih.
brojevi = [1, 2,3,43,43,43564]
for broj in brojevi:
    print(broj)

# 2. Kreirati torku logičkih vrednosti i pomoću for petlje ispisati svaku od njih.
logicke_vrednost = (1, 1, 0, 1, 1, 1, 1, 0)
for lv in logicke_vrednost:
    print(bool(lv))

# 3. Kreirati skup stringova i pomoću for petlje ispisati svaki od njih.
stringovi = {"prvi", "peti", "osmi", "drugi"}
for str in stringovi:
    print(str)

# 4. Kreirati proizvoljni rečnik i pomoću for petlje ispisati sve ključeve.
recnik = {
  "brend": "Porshe",
  "model": "Cayman",
  "godina": 2023,
}
for kljuc in recnik.keys():
    print(kljuc)

# 5. Data je lista: lista = ["jabuke", "banane", "kivi", "mandarine", "grozdje", "mango"]. Pomoću
# for petlje ispisivati element po element. Ukoliko se „kivi“ nalazi u listi, preskočiti ga i nastaviti
# ispis od sledećeg elementa, a ukoliko se „grozdje“ nalazi u listi prekinuti izvršavanje petlje.
lista = ["jabuke", "banane", "kivi", "mandarine", "grozdje", "mango"]
for element in lista:
    if element == "kivi":
        continue
    elif element == "grozdje":
        break
    else:
        print(element)

# 6. Data je promenljiva i = 5. Ispisivati njenu vrednost u while petlji dokle god je ona manja ili
# jednaka 10.
i = 5

while i <= 10:
    print(i)
    i += 1

# 7. Data je promenljiva i = 1. Ispisivati njenu vrednost u while petlji dokle god je ona manja od 6,
# a kada prestane da bude manja, ispisati „Vrednost promenljive i više nije manja od 6“
i = 1

while i < 6:
    print(i)
    i += 1
else:
    print("Vrednost promenljive i više nije manja od 6")