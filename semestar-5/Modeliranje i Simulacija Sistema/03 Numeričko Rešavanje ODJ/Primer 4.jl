using DifferentialEquations
using Plots

# funkcija modeluje signal za ulaz u(t)
function signal(t)
    tp = rem.(t, 5)

    y_prava_1 = (3 * tp) .* (tp .< 1)
    y_prava_2 = (3) .* ((tp .>= 1) .& (tp .< 3))
    y_prava_3 = (-3 / 2 * tp .+ 15/2) .* ((tp .>= 3))

    y = y_prava_1 .+ y_prava_2 .+ y_prava_3

    return y
end

# funkcija modeluje resenje diferencijalne jednacine
function diferencijalnaJednacina(dx, x, parametri, t)
    A, B = parametri
    u = signal(t)

    dx[1] = u + A * x[3]
    dx[2] = x[3]
    dx[3] = x[2] - B * x[1]
end

# main.jl
t = 0:0.01:15

# plot(t, signal(t)) # provera jednacina pravih za signal

x0 = [-1.0, 1.0, 0.5]
tspan = (0.0, 15.0)
parametri = (2.0, 1.0)

problem = ODEProblem(diferencijalnaJednacina, x0, tspan, parametri)
resenje = solve(problem)

plot(resenje)