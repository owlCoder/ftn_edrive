using Plots
using LinearAlgebra

t  = 0:0.01:2π;
tp = rem.(t, 1)

y = sin.(t .* (tp .< 0.5));
ys = sin.(t);

plot(t, ys, color=:red, label="sin(t)", linestyle=:dash)
plot!(t, y, lw=2, title="\nZadatak 2\n", label="y(t)", color=:blue)

