include("student.jl")
include("program.jl")

opseg = [9.10, 9.85]

nizPronadjenih, brojPronadjenih = linearnoPretraži(studenti, opseg)

if brojPronadjenih == 0
    println("Za opseg prosečne ocene [$(opseg[1]) - $(opseg[2])] nema studenata.")
else
    println("OPSEG PROSEČNE OCENE: [$(opseg[1]) - $(opseg[2])]\n")
    for i in 1:brojPronadjenih
        println("Ime:              $(nizPronadjenih[i].ime)")
        println("Prezime:          $(nizPronadjenih[i].prezime)")
        println("Broj indeksa:     $(nizPronadjenih[i].brojIndeksa)")
        println("Prosečna ocena:   $(nizPronadjenih[i].ocena)")
        println()
    end
end