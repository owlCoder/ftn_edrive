using Plots, DifferentialEquations

function diferencijalneJednаčine!(dx, x, p, t)
    m, c1, c2, k1, k2, g = p
    f = sin(t)

    dx[1] = x[2]
    dx[2] = (-1 / m) * (c1 * x[2] + k1 * x[1] + k2 * (x[1] - x[3]) - m * g)
    dx[3] = (k2 * (x[1] - x[3]) - 3 * f) / (9 * c2)
end

# main.jl
x0 = [-1.0, 0.0, 0.0]
t = (0.0, 100.0)
p = (10.0, 10.0, 10.0, 15.0, 10.0, 9.81)

problem = ODEProblem(diferencijalneJednаčine!, x0, t, p)
rešenje = solve(problem)

plot(rešenje)

# pod d) -> promena brzina tela mase m prvih 20s
v = [x[2] for x in rešenje.u]
plot(rešenje.t[rešenje.t .<= 20], v[rešenje.t .<= 20], label = "v(t)", lw = 2)

# pod e) -> promena pozicije tela mase m i levog kraja poluge
x1 = [x[1] for x in rešenje.u]
x2 = [x[3] for x in rešenje.u]

plot(rešenje.t, [x1, x2], legend=:bottomright, label = ["x1(t)" "x2(t)"], lw = 2, yticks = -1:6)