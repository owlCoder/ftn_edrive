using Printf

struct Košarkaš
    ime::String
    prezime::String
    visina::Int
    pozicija::String
end

košarkaši = []
push!(košarkaši, Košarkaš("Benevento", "Turino",  255, "bek"))
push!(košarkaši, Košarkaš("Milan", "Tenere",      135, "centar"))
push!(košarkaši, Košarkaš("Juventus", "Korol",    197, "centar"))
push!(košarkaši, Košarkaš("Napoli", "Tutlo",      134, "levo krilo"))
push!(košarkaši, Košarkaš("Inter", "Kamalo",      127, "desno krilo"))
push!(košarkaši, Košarkaš("Roma", "Divergeni",    144, "centar"))
push!(košarkaši, Košarkaš("Fiorentina", "Tiruto", 149, "bek"))
push!(košarkaši, Košarkaš("Lazio", "Kamalo",      138, "centar"))
push!(košarkaši, Košarkaš("Atalanta", "Kamalo",   138, "levo krilo"))

function uporedi(K1, K2)
	return K1.visina > K2.visina || 
        (K1.visina == K2.visina && K1.pozicija > K2.pozicija)
end

function ispisKošarkaša(košarkaši)
  for i in 1:length(košarkaši)
     @printf("%2i. %-15s %-15s %3i\n", i, košarkaši[i].ime, košarkaši[i].prezime, košarkaši[i].visina)
  end
end