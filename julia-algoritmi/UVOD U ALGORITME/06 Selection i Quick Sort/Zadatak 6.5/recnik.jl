struct Recnik 
    rec::String
end

recnici = []

push!(recnici, Recnik("abeceda"))
push!(recnici, Recnik("triceda"))
push!(recnici, Recnik("pretraživač"))
push!(recnici, Recnik("editor"))
push!(recnici, Recnik("nov"))
push!(recnici, Recnik("zima"))
push!(recnici, Recnik("sto"))
push!(recnici, Recnik("crvena"))
push!(recnici, Recnik("triceda"))
push!(recnici, Recnik("dugme"))
push!(recnici, Recnik("igla"))
push!(recnici, Recnik("eskim"))
push!(recnici, Recnik("abeceda"))
push!(recnici, Recnik("tekst"))
push!(recnici, Recnik("triceda"))
push!(recnici, Recnik("poruka"))
push!(recnici, Recnik("kanta"))
push!(recnici, Recnik("plus"))
push!(recnici, Recnik("minus"))
push!(recnici, Recnik("slovo"))

using Printf

function ispisRečnika(recnici)
    @printf("R.BR\t%-5s\n", "REČ")
    for i in 1:length(recnici)
        @printf("%i. \t%-7s\n", i, recnici[i].rec)
    end
end

function uporedi(r1, r2)
    return r1.rec <= r2.rec
end
