using LinearAlgebra, Plots, DifferentialEquations

function sistem!(dx, x, p, t)
    m, c, k, g = p
    f = cos(t)
    dx[1] = x[2]
    dx[2] = 1 / m * (f + m * g - k * x[1] - c * x[2])
end

t = (0.0, 20.0)
x0 = [0.0, 0.0]
p = (5.0, 10.0, 20.0, 9.81)

prob = ODEProblem(sistem!, x0, t, p)
sol = solve(prob)

plot(sol, label=["x1(t)" "x2(t)"], lw=2, xticks=0:20)
