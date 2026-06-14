using Printf

struct Košarkaš
    ime::String
    prezime::String
    brojPoena::Int
    brojPatika::Float64
end

košarkaši = []
push!(košarkaši, Košarkaš("Benevento", "Turino",  255, 43.5))
push!(košarkaši, Košarkaš("Milan", "Tenere",      135, 42))
push!(košarkaši, Košarkaš("Juventus", "Korol",    197, 38))
push!(košarkaši, Košarkaš("Napoli", "Tutlo",      134, 39))
push!(košarkaši, Košarkaš("Inter", "Kamalo",      127, 35))
push!(košarkaši, Košarkaš("Roma", "Divergeni",    144, 46.5))
push!(košarkaši, Košarkaš("Fiorentina", "Tiruto", 149, 37))
push!(košarkaši, Košarkaš("Lazio", "Kamalo",      138, 35))
push!(košarkaši, Košarkaš("Atalanta", "Kamalo",   138, 46))

function ispisKošarkaša(košarkaši)
  for i in 1:length(košarkaši)
     @printf("%2i. %-15s %3i %.2f\n", i, košarkaši[i].ime, košarkaši[i].brojPoena, košarkaši[i].brojPatika)
  end
end