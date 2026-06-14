include("student.jl")

function insertionSort!(s)
    for j in 2:length(s)
        key = s[j]
        i = j - 1

        while i > 0 && s[i].brojIndeksa > key.brojIndeksa    # znak > ili < menja način sortiranja sa
            s[i + 1] = s[i]                                  # RASTUĆE/OPADAJUĆE
            i = i - 1
        end
        s[i + 1] = key
    end
end

function sortStructArray()   
    println("Pre sortiranja:") 
    ispisStudenata(studenti)

    insertionSort!(studenti)
    println("\nPosle sortiranja:")
    ispisStudenata(studenti)

end

sortStructArray()
