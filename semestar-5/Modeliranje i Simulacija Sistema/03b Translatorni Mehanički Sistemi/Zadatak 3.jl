using LinearAlgebra, Plots, DifferentialEquations

function signal(t)
    y = abs.(sin.(pi / 3 * t))
 end

function diferencijalneJednačine!(dx, x, p, t)
    m1, m2, m3, c, k, g = p
    f = signal(t)

    dx[1] = x[2]
    dx[2] = -1 / m1 * (c * (x[2] - x[4]) + k * (2 * x[1] - x[3]) - m1 * g)
    dx[3] = x[4]
    dx[4] = 1 / m2 * (c * (x[2] - x[4]) - k * (x[3] - x[5]) + k * (x[1] - x[3]) - k * x[3] + m2 * g)
    dx[5] = x[6]
    dx[6] = 1 / m3 * (k * (x[3] - x[5]) + m3 * g - f)
end

# main.jl
t = (0.0, 12.0)
p = (5.0, 10.0, 5.0, 10.0, 15.0, 9.81)
x0 = [0.0, 3.0, 0.0, 3.0, 0.0, 3.0]

problem = ODEProblem(diferencijalneJednačine!, x0, t, p)
rešenje = solve(problem)

plot(rešenje)

# pod d) 
# promena pozicija tela m1 i m2 i najudaljenije tacke
p1 = [x[1] for x in rešenje.u]
p2 = [x[3] for x in rešenje.u]

~, idx1 = findmax(abs.(p1))
~, idx2 = findmax(abs.(p2))

plot(rešenje.t, [p1, p2], lw = 2, label = ["Δx1" "Δx2"])
plot!([rešenje.t[idx1]], [p1[idx1]], markershape = :o, color = :red, label = "max Δx1")
plot!([rešenje.t[idx2]], [p2[idx2]], markershape = :o, color = :green, label = "max Δx2")

# pod e)
# promenu rastojanja između tela mase m2 i m3, ako je rastojanje
# u početnom trenutku iznosilo 2
p2 = [x[3] for x in rešenje.u]
p3 = [x[5] for x in rešenje.u]

abs_rastojanje_m2_m3 = abs.(p2 .- p3)
promena_rastojanja = diff(abs_rastojanje_m2_m3)
promena_rastojanja = promena_rastojanja .+ 2

plot([rešenje.t], [p2, p3], lw = 2, label = ["Δx2" "Δx3"], xticks = 0:12, yticks = 0:2:30)
plot!(rešenje.t[1:end-1], promena_rastojanja, lw = 2, color = :green, label = "prom. rast.")