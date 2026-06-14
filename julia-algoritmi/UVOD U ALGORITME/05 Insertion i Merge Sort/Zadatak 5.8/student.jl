#studenti.jl
using Printf

struct Student
    ime::String
    prezime::String
    brojIndeksa::Int
    brojPoena::Int
end

studenti = []
push!(studenti, Student("Marko", "Markovic",  13, 40))
push!(studenti, Student("Nikola", "Tomic",     8, 78))
push!(studenti, Student("Srdjan", "Knezevic",  5, 62))
push!(studenti, Student("Vanja", "Kovacevic", 17, 50))
push!(studenti, Student("Nenad", "Nikolic",   16, 40))
push!(studenti, Student("Ivana", "Ivanovic",   2, 92))
push!(studenti, Student("Branislav", "Tomic", 70, 66))
push!(studenti, Student("Stefan", "Zivkovic",  3, 30))


function ispisStudenata(studenti)
  for i in 1:length(studenti)
     @printf("%2i. %-10s %-10s %3i %3i\n", i, studenti[i].ime, 
              studenti[i].prezime, studenti[i].brojIndeksa, studenti[i].brojPoena)
  end
end

function ispisStudenataUIntervalu(studenti, donjaGranica, gornjaGranica)
  if donjaGranica < 1
        error("NISU UNETE ISPRAVNE GRANICE ISPISA!")
  end

  for i in donjaGranica:gornjaGranica
     @printf("%2i. %-10s %-10s %3i %3i\n", i, studenti[i].ime, 
              studenti[i].prezime, studenti[i].brojIndeksa, studenti[i].brojPoena)
  end
end