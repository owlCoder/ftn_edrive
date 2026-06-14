include("program.jl")

a =  21
b = -24
niz = niz_neparnih_celih_brojeva(a, b)

println("Interval od $a do $b")

n = size(niz, 1)
for i in 1:n
    print("$(niz[i]) ")
end