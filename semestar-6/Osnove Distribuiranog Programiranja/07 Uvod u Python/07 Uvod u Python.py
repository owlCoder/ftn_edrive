# Primer 1
jezik = 'python'

if jezik == 'python':
    print('Radimo python!')
else:
    print('Nepoznat jezik.')
    
print('Gotovo!')

# Primer 2
j = 1
while(j <= 5):
    print(j)
    j = j + 1

# Primer 3
# Ovo je komentar
print("Komentar")

# Primer 4
a, b = 1, 3 # Deklarisanje dve promenljive
zbir = a + b # Sabiranje dve promenljive
print(zbir) # Ispis rezultata

# Primer 5
#print("Zdravo, svete!")
print("Zdravo, prijatelju!")

# Primer 6
# Ovo je primer
# viselinijskog
# komentara
"""
Ovo je primer
viselinijskog
komentara
"""

# Primer 7 – provera tipa pozivom funkcije type()
x = 5
print(type(x)) # Ispisuje <class 'int'>

# Primer 9 – eksplicitno navođenje tipa pri dodeli vrednosti
x = str("Zdravo")
x = int(20)
x = list(("jabuka", "banana", "limun"))
x = dict(name="Marko", age=23)

# Primer 10
x = int(1) # x ce biti 1
y = int(2.8) # y ce biti 2
z = int("3") # z ce biti 3
x = float(1) # x ce biti 1.0
y = float(2.8) # y ce biti 2.8
z = float("3") # z ce biti 3.0
w = float("4.2") # w ce biti 4.2
x = str("s1") # x ce biti 's1'
y = str(2) # y ce biti '2'
z = str(3.0) # z ce biti '3.0'

# Primer 11
tekst = 'Neki tekst'
slovo = "A"

# Primer 12
dugacakTekst = """Važno je, možda, i to da znamo
Čovek je željan tek ako želi
I ako sebe celoga damo
Tek tada i možemo biti celi.
Saznaćemo tek ako kažemo
Reči iskrene, istovatne
I samo onda kad i mi tražimo
Moći će neko i nas da sretne"""

# Primer 13
a = "Zdravo!"
print(len(a)) # Ispisuje 7

# Primer 14
tekst = "Najbolje stvari u životu su besplatne!"
print("besplatne" in tekst) # Ispisuje True
tekst = "Najbolje stvari u životu su besplatne!"
print("skupe" not in tekst) # Ispisuje True

# Primer 15
pozdrav = "Zdravo svima!"
print(pozdrav[7:10]) # Ispisuje 'svi'
print(pozdrav[:6]) # Ispisuje 'Zdravo'
print(pozdrav[7:]) # Ispisuje 'svima!'

# Prebacivanje u velika slova – upper()
a = "Zdravo!"
print(a.upper()) # Ispisuje 'ZDRAVO!'

# Prebacivanje u mala slova – lower()
a = "Zdravo, Marko!"
print(a.lower()) # Ispisuje 'zdravo, marko!'

# Uklanjanje razmaka – strip()
a = " Zdravo! "
print(a.strip()) # Ispisuje 'Zdravo!

# Zamena – replace()
a = "Cao svima!"
print(a.replace("Cao", "Zdravo")) # Ispisuje 'Zdravo svima!'

# Primer 16
tekst = "Ovo je "citat""

# Primer 17
tekst = "Ovo je \"citat\""
print(tekst) # Ispisuje 'Ovo je "citat"'

# Primer 18
tekst = "Ispis obrnute kose crte: \\"
print(tekst) # Ispisuje 'Ispis obrnute kose crte: \'

# Primer 19
tekst = input("Unesite neki tekst: ")

# Primer 20
broj = int(input("Unesite neki broj: "))

# Primer 21
print("Neki tekst") # Ispisuje 'Neki tekst'
print(5) # Ispisuje '5'
x = 2.4
print(x) # Ispisuje '2.4'
print("x = ", x) # Ispisuje 'x = 2.4'
a = 2
b = 3
print("a + b =", a+b) # Ispisuje 'a + b = 5'