include("košarkaš.jl")
include("program.jl")

pretraženo = linearnoPretrazi(košarkaši, "centar", 210)

if pretraženo == []
    println("Košarkaš ne postoji.")
else
    for i in 1:length(pretraženo)
        println("Ime:      $(pretraženo[i].Ime)")
        println("Prezime:  $(pretraženo[i].Prezime)")
        println("Pozicija: $(pretraženo[i].Pozicija)")
        println("Visina:   $(pretraženo[i].Visina)")
        println()
    end
end
