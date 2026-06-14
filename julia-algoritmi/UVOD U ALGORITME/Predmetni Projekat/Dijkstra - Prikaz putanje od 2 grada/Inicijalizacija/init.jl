# init.jl
# Init skripta za pripremu grafa, veza, čvorova, unos broja, ispisa razdaljina
# Autor: PR55-2020 Danijel Jovanović

include("../Graf/graf.jl")
include("../quickSort/quickSort.jl")

using Printf

function inicijalizuj_početne_vrednosti()
    g = Graf();
    veze = ((1, 2, 15), (1, 3, 14), (1, 4, 10), (1, 5, 11), (1, 6, 6), (1, 8, 2),   # ČVOR  1
            (2, 3, 2), (2, 10, 10), (2, 11, 54), (2, 12, 36),                       # ČVOR  2
            (3, 4, 5),                                                              # ČVOR  3
            (4, 5, 1),                                                              # ČVOR  4
            # NIJE POVEZAN                                                          # ČVOR  5
            (6, 5, 4), (6, 7, 1),                                                   # ČVOR  6
            # NIJE POVEZAN                                                          # ČVOR  7
            (8, 7, 8), (8, 9, 5), (8, 2, 9), (8, 6, 3),                             # ČVOR  8
            (9, 2, 3), (9, 10, 2),                                                  # ČVOR  9
            # NIJE POVEZAN                                                          # ČVOR 10
            (11, 3, 9), (11, 10, 1),                                                # ČVOR 11
            (12, 3, 5), (12, 11, 1)                                                 # ČVOR 12
            ) 

    dodajVezeTežine!(g, veze)
    return g
end

function unos_broja()
    unos = 0
    while unos < 1 || unos > 12
        print("UNESITE POČETNI (REFERENTI) ČVOR X: ")
        str = readline(stdin)
        ucitano = 0
    
        try
            ucitano = parse(Int32, str)
        catch
            global unos = 0
        end

        unos = ucitano
    end
    
    println()
    return unos
end

mutable struct formatiraniIspisČvora
    idČvora::Int64
    tekst::String
end

formatirano = []

function ispis_razdaljina(g, udaljeni)
    println("\n --------------------------------------------------")
    @printf(" |  ČVOR\t  GRAD       %17s\n", "      UDALJENOST     |")
    println(" --------------------------------------------------")

    i = 1
    for (id, u) in g.V
        tekst = string(@sprintf(" |  [%02d]\t  %-5s\t %15.2f  |\n", id, u.ImeGrada, udaljeni[i]))
        push!(formatirano, formatiraniIspisČvora(id, tekst))
        i += 1
    end

   quickSort!(formatirano)

    for i in 1:length(formatirano)
        @printf("%s", formatirano[i].tekst)
    end
    println(" --------------------------------------------------")
end