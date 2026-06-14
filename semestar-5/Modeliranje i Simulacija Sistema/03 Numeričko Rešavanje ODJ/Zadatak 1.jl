using DifferentialEquations
using Plots

function diferencijalnaJednacina!(dx, x, parametri, t)
    α, β, γ = parametri

    dx[1] = α * (x[2] - x[1])
    dx[2] = x[1] * (β - x[3])
    dx[3] = x[1] * x[2] - γ * x[3]
end

# main.jl
x0 = [1.0, 0.0, 0.0]
parametri = (10.0, 27.0, 8 / 3)
tspan = (0.0, 30.0)

problem_a = ODEProblem(diferencijalnaJednacina!, x0, tspan, parametri)
resenje_a = solve(problem_a)

plot(resenje_a)

# pod b
x0_b = [1.0, 0.01, 0.01]
problem_b = ODEProblem(diferencijalnaJednacina!, x0_b, tspan, parametri)
resenje_b = solve(problem_b)

plot!(resenje_b)