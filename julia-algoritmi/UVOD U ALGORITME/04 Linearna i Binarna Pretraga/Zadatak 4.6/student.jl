struct Student 
    ime::String
    prezime::String
    brojIndeksa::Int
    ocena::Float64
 end

 studenti = Array{Student}(undef, 6)

 studenti[1] = Student("Mitar", "Miric", 12, 9.33)
 studenti[2] = Student("Dragan", "Kojic", 32, 8.52)
 studenti[3] = Student("Miroslav", "Ilic", 63, 10.00)
 studenti[4] = Student("Predrag", "Gojkovic", 2, 9.56)
 studenti[5] = Student("Toma", "Zdravkovic", 3, 7.65)
 studenti[6] = Student("Marinko", "Rokvic", 44, 9.01)