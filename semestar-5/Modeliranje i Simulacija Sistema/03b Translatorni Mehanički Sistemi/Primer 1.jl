using LinearAlgebra, Plots, DifferentialEquations

function diferencijalneJednačine!(dx, x, p, t)
    m, c1, c2, k = p
    f = sin(t)

    dx[1] = x[2]
    dx[2] = 1 / m * (f - k * x[1] - x[2] * (c1 + c2))
end

# main.jl
t = (0.0, 10.0)
x0 = [0, 0]
p = (10.0, 20.0, 20.0, 40.0)

problem = ODEProblem(diferencijalneJednačine!, x0, t, p)
rešenje = solve(problem)
plot(rešenje, label = ["x1(t)" "x2(t)"], lw = 2, xticks = 0:10)