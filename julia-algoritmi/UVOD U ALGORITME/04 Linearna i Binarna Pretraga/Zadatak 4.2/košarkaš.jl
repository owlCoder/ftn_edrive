struct Košarkaš
    Ime::String
    Prezime::String
    Pozicija::String
    Visina::Int
end

košarkaši = Array{Košarkaš}(undef, 6)

košarkaši[1] = Košarkaš("Mitar", "Miric", "centar", 211)
košarkaši[2] = Košarkaš("Dragan", "Kojic", "centar", 201)
košarkaši[3] = Košarkaš("Miroslav", "Ilic", "bek", 186)
košarkaši[4] = Košarkaš("Predrag", "Gojkovic", "krilo", 196)
košarkaši[5] = Košarkaš("Toma", "Zdravkovic", "centar", 221)
košarkaši[6] = Košarkaš("Marinko", "Rokvic", "vodič", 236)