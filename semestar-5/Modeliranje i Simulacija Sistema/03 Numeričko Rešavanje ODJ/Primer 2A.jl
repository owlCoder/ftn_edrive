using DifferentialEquations
using Plots

function vanDerPol!(dx, x, p, t)
    μ = p
    dx[1] = x[2]
    dx[2] = μ * (1 - x[1] ^ 2) * x[2] - x[1]
end

x0 = [0.25, 0.25] # pocetni uslovi
interval = (0.0, 30.0) # posmatrani vremeneski period

parametri = μ = 1.0

problem = ODEProblem(vanDerPol!, x0, interval, parametri)
resenje = solve(problem)

plot(resenje, xlabel="t", ylabel="u", label=["x1" "x2"])