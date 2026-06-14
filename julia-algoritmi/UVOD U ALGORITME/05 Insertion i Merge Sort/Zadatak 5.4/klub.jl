using Printf

struct Klub
    ime::String
    brojPoena::Int
    datiGolovi::Int
    primljeniGolovi::Int
end

klubovi = []
push!(klubovi, Klub("Benevento",  30, 30, 55))
push!(klubovi, Klub("Milan",      63, 57, 35))
push!(klubovi, Klub("Juventus",   62, 61, 27))
push!(klubovi, Klub("Napoli",     59, 65, 34))
push!(klubovi, Klub("Inter",      74, 69, 27))
push!(klubovi, Klub("Roma",       54, 54, 44))
push!(klubovi, Klub("Fiorentina", 30, 38, 49))
push!(klubovi, Klub("Lazio",      55, 46, 38))
push!(klubovi, Klub("Atalanta",   61, 71, 38))

function uporedi(klub1, klub2)
	return klub1.brojPoena > klub2.brojPoena || klub1.brojPoena == klub2.brojPoena && 
	       (klub1.datiGolovi-klub1.primljeniGolovi>klub2.datiGolovi-klub2.primljeniGolovi)
end

function ispisKlubova(klubovi)
  for i in 1:length(klubovi)
     @printf("%2i. %-15s %3i %3i %3i\n", i, klubovi[i].ime, 
              klubovi[i].brojPoena, klubovi[i].datiGolovi, klubovi[i].primljeniGolovi)
  end
end