using LinearAlgebra, Plots, DifferentialEquations

function signal(t)
    tp = rem.(t, 1)

    y = (1 / 2 * t) .* (tp .< 0.5) +
         (0 * tp) .* (tp .>= 0.5) 
end

function diferencijalneJednačine!(dx, x, p, t)
    m1, m2, c1, c2, c3, k1, k2, g = p
    f = signal(t)

    dx[1] = x[2]
    dx[2] = -1 / m1 * (c1 * x[2] + k2 * (x[1] - x[3]) + k1 * x[1] - m1 * g)
    dx[3] = x[4]
    dx[4] = -1 / m2 * (c2 * x[4] - m2 * g - k2 * (x[1] - x[3]) - f)
end

# main.jl
t = (0.0, 10.0)
p = (20.0, 10.0, 10.0, 10.0, 10.0, 20.0, 40.0, 9.81)
x0 = [-1.0, 0.0, -1.0, 0.0]

problem = ODEProblem(diferencijalneJednačine!, x0, t, p)
rešenje = solve(problem)

plot(rešenje)

# pod d)
p1 = [x[1] for x in rešenje.u]
v1 = [x[2] for x in rešenje.u]

plot(rešenje.t, [p1 v1], xticks = 0:10, lw = 2, label = ["Δx1(t)" "Δv1(t)"] )

# pod e)
a1 = diff(v1) ./ diff(rešenje.t)
~, max_a1 = findmax(abs.(a1))

plot(rešenje.t[1:end-1], [a1], xticks = 0:10, lw = 2, label = "a1(t)")
plot!([rešenje.t[max_a1]], [a1[max_a1]], markershape = :x, color = :green)