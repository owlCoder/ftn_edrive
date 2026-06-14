using Plots, DifferentialEquations

function diferencijalneJednačine!(dx, x, p, t)
    m1, m2, c, k1, k2, R, g = p
    f = sin(t)
    J = 1 / 2 * m1 * R ^ 2

    dx[1] = x[2]
    dx[2] = (1 / J) * (k2 * (x[3] - R * x[1]) * R - k1 * x[1] - c * x[2])
    dx[3] = x[4]
    dx[4] = (1 / m2) * (f + m2 * g - k2 * (x[3] - R * x[1]))
end

# main.jl
t = (0.0, 20.0)
p = (10.0, 5.0, 10.0, 15.0, 10.0, 1.0, 9.81)
x0 = [0.0, 0.0, 2.0, 0.0]

problem = ODEProblem(diferencijalneJednačine!, x0, t, p)
rešenje = solve(problem)

Θ = [x[1] for x in rešenje.u]
ω = [x[2] for x in rešenje.u]
α = diff(ω) ./ diff(rešenje.t)

plot(rešenje.t, [Θ, ω], lw = 2, label = ["θ(t)" "ω(t)"])
plot!(rešenje.t[1:end-1], α, lw = 2, label = "α(t)")