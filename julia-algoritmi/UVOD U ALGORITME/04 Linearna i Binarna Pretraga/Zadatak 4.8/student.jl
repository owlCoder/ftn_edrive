struct Student 
    ime::String
    prezime::String
    brojIndeksa::Int
 end

 studenti = Array{Student}(undef, 6)

 studenti[1] = Student("Mitar", "Miric", 3)
 studenti[2] = Student("Dragan", "Kojic", 12)
 studenti[3] = Student("Miroslav", "Ilic", 34)
 studenti[4] = Student("Predrag", "Gojkovic", 72)
 studenti[5] = Student("Toma", "Zdravkovic", 73)
 studenti[6] = Student("Marinko", "Rokvic", 144)