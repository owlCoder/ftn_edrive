#teniseri.jl
using Printf

struct Teniser
    ime::String
    prezime::String
    brojPoena::Int
end

teniseri = []
push!(teniseri, Teniser("Benevento", "Turino",  55))
push!(teniseri, Teniser("Milan", "Tenere",     135))
push!(teniseri, Teniser("Juventus", "Korol",    27))
push!(teniseri, Teniser("Napoli", "Tutlo",      34))
push!(teniseri, Teniser("Inter", "Kamalo",      27))
push!(teniseri, Teniser("Roma", "Divergeni",    44))
push!(teniseri, Teniser("Fiorentina", "Tiruto", 49))
push!(teniseri, Teniser("Lazio", "Kamalo",      38))
push!(teniseri, Teniser("Atalanta", "Kamalo",   38))

function uporedi(Teniser1, Teniser2)
	return Teniser1.brojPoena > Teniser2.brojPoena || Teniser1.ime == Teniser2.ime && 
	       (Teniser1.prezime > Teniser2.prezime)
end

function ispisTenisera(teniseri)
  for i in 1:length(teniseri)
     @printf("%2i. %-15s %-15s %3i\n", i, teniseri[i].ime, teniseri[i].prezime, teniseri[i].brojPoena)
  end
end