using Plots

t = 0:0.001:15
tp = rem.(t, 3)

y = (3 * tp) .* (tp .<= 1) .+
    (3 * ((tp .> 1) .& (tp .<= 2))) .+
    ((-3 * tp .+ 9) .* (tp .> 2))

plot(t, y, xticks=0:15)
