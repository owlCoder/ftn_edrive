using LinearAlgebra, Plots, DifferentialEquations

function diferencijalneJednačine!(dx, x, p, t)
    m1, m2, c, k1, k2, k3, g = p

    dx[1] = x[2]
    dx[2] = 1 / m1 * (m1 * g + k2 * x[3] - (k1 + k2) * x[1])
    dx[3] = x[4]
    dx[4] = 1 / m2 * (k2 * x[1] - m2 * g - c * x[4] - (k2 + k3) * x[3])
end

# main.jl
t = (0.0, 20.0)
p = (5.0, 8.0, 10.0, 20.0, 20.0, 20.0, 9.81)
x0 = [2.0, 0.0, 0.0, 0.0]

problem = ODEProblem(diferencijalneJednačine!, x0, t, p)
rešenje = solve(problem)

# pod d)
v1 = [x[2] for x in rešenje.u]
v2 = [x[4] for x in rešenje.u]

~, index1 = findmax(abs.(v1))
~, index2 = findmax(abs.(v2))

plot(rešenje.t, [v1 v2], lw = 2, xticks = 0:20, label = ["v1(t)" "v2(t)"])
plot!([rešenje.t[index1]], [v1[index1]], markershape = :o, color = :red, lw = 2, label = "max v1")
plot!([rešenje.t[index2]], [v2[index2]], markershape = :o, color = :green, lw = 2, label = "max v2")

# pod e)
a1 = diff(v1) ./ diff(rešenje.t)
a2 = diff(v2) ./ diff(rešenje.t)

plot(rešenje.t[1:end-1], [a1, a2], lw = 2, label = ["a1(t)" "a2(t)"])