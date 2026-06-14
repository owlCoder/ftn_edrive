using DifferentialEquations
using Plots

function diferencijalnaJednacina!(y, parametri, t)
    α, λ = parametri
    dy = λ * exp(-α * t) * y

    return dy
end

function analitickoResenje!(t, y0, parametri)
    α, λ = parametri
    y = y0 * exp.(λ / α * (1 .- exp.(-α * t)))

    return y
end

# main.jl
y0 = 1.0
parametri = (1.0, 1.0)
interval = (0.0, 5.0)

problem = ODEProblem(diferencijalnaJednacina!, y0, interval, parametri)
numerickoResenje = solve(problem)

t1 = 0:0.01:5
analitickoResenje = analitickoResenje!(t1, y0, parametri)
numerickoResenje = numerickoResenje(t1)

plot(t1, analitickoResenje, xlabel="t", ylabel="u", label="analiticko")
plot!(t1, numerickoResenje, label="numericko")
