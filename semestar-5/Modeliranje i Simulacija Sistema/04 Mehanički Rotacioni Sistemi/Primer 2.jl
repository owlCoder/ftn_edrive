using Plots, DifferentialEquations

function signal(t)
    tp = rem.(t, 3)

    y= (-1 / 3 * t .+ 5) .* (tp .<= 2)
end

function diferencijalneJednаčine!(dx, x, p, t)
    m1, m2, c, k1, k2, R, g = p
    J = 1 / 2 * m1 * R ^ 2
    f = signal(t)

    dx[1] = x[2]
    dx[2] = (-1 / J) * (k2 * (x[3] + R * x[1]) * R + c * R ^ 2 * x[2])
    dx[3] = x[4]
    dx[4] = (1 / m2) * (m2 * g - f - k1 * x[3] - k2 * (x[3] + R * x[1]))
end

# main.jl
t = (0.0, 15.0)
p = (10.0, 5.0, 10.0, 15.0, 10.0, 1.0, 9.81)
x0 = [0.0, 0.0, 0.0, 0.0]

problem = ODEProblem(diferencijalneJednаčine!, x0, t, p)
rešenje = solve(problem)

plot(rešenje)

# pod d)
x = [x[3] for x in rešenje.u]
predjeni_put = sum(abs.(diff(x)))
println("Predjeni put tela mase m2 iznosi: ", predjeni_put)

# pod e)
θ = [x[1] for x in rešenje.u]
ω = [x[2] for x in rešenje.u]

plot(rešenje.t, [θ, ω], lw = 2, label = ["θ(t)" "ω(t)"])