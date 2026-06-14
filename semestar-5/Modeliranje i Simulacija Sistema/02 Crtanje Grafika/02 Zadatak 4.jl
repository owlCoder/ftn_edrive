using Plots

t = 0:0.01:9

y1 = 2 * sin.(pi / 3 * t)
y2 = min.(y1, 1)
y = max.(y2, -1)

plot(t, y1, linestyle=:dash, color=:red, label="sin")
plot!(t, y, xticks=0:9, lw=1, color=:blue)

xlabel!("t")
ylabel!("y")
