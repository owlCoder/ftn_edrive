using Plots

t = 0:0.01:10
tp = rem.(tp, 5)

y1 = (2 * tp) .* (t .< 2)
y2 = 2 * ((tp .>= 2) .& (tp .< 4))

# prava simetricna na y1 -> y = -2t sada je potrebno
# izracunati na
# y = k*t + n, uvrsti se jedna tacka npr A(4, 2)
# n = 2 + 2 * 4 -> n = 10
y3 = ((- 2 * tp) .+ 10) .* ((tp .>= 4) .& (tp .<= 5))

y = y1 .+ y2 .+ y3

plot(t, y, title="\nZadatak 1\n", xticks=0:10)
xlabel!("tp")
ylabel!("y")
