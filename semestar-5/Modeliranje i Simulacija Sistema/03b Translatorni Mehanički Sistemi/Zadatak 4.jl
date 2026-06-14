using LinearAlgebra, Plots, DifferentialEquations

function signal(t)
    tp = rem.(t, 3)

    y_sinus = abs.(sin.(pi / 3 * t))
    y_prava = 1 / 3 * tp

    y = min.(y_sinus, y_prava)
end

function diferencijalneJednačine!(dx, x, p, t)
    m1, m2, c1, c2, k1, k2, g = p
    f = signal(t)

    dx[1] = x[2]
    dx[2] = -1 / m1 * (c1 * x[2] + k1 * (x[1] - x[3]) - f)
    dx[3] = x[4]
    dx[4] = -1 / m2 * (c2 * x[4] - k1 * (x[1] - x[3]) + k2 * x[3] + m2 * g)
end

# main.jl
t = (0.0, 12.0)
p = (10.0, 8.0, 5.0, 10.0, 15.0, 15.0, 9.81)
x0 = [0.0, 0.0, 0.0, 0.0]

problem = ODEProblem(diferencijalneJednačine!, x0, t, p)
rešenje = solve(problem)

plot(rešenje)

# pod d
p1 = [x[1] for x in rešenje.u]
p2 = [x[3] for x in rešenje.u]

plot(rešenje.t, [p1 p2], label = ["x1" "x3"])

# pod e
v1 = [x[2] for x in rešenje.u]
a1 = diff(v1) ./ diff(rešenje.t)

~, idx1 = findmax(abs.(v1))
~, idx2 = findmax(abs.(a1))

plot([rešenje.t], [v1], label = "v1")
plot!([rešenje.t[1:end-1]], [a1], label = "a1")
plot!([rešenje.t[idx1]], [v1[idx1]], markershape = :o, label = "max v1")
plot!([rešenje.t[idx2]], [a1[idx2]], markershape = :o, label = "max a1")