include("košarkaš.jl")
include("program.jl")

ključ = 236
pretraženo = binarnoPretraži(košarkaši, ključ)

if pretraženo == -1
    println("Košarkaš ne postoji.")
else
    i = pretraženo

    while(i > 1 && košarkaši[i - 1].Visina == ključ)
        global i -= 1
    end

    j = pretraženo

    while(j < length(košarkaši) && košarkaši[j + 1].Visina == ključ)
        global j += 1
    end

    for k in i:j
        println("Ime:      $(košarkaši[k].Ime)")
        println("Prezime:  $(košarkaši[k].Prezime)")
        println("Pozicija: $(košarkaši[k].Pozicija)")
        println("Visina:   $(košarkaši[k].Visina)")
    end
end