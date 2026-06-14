using LinearAlgebra, Plots, DifferentialEquations

function signal(t)
    tp = rem.(t, 2)

    y_prava1 = (2 * tp) .* (tp .< 1)
    y_prava2 = (-2 * tp .+ 4) .* (tp .>= 1)
    y1 = y_prava1 .+ y_prava2
    y_kruznica = sqrt.(1 .- ((tp .- 1) .^ 2))

    y = min.(y1, y_kruznica)
end

function diferencijalneJednačine!(dx, x, p, t)
    m, c1, c2, k1, k2, R = p  
    f = signal(t)
    J = 1 / 2 * m * R ^ 2

    dx[1] = x[2]
    dx[2] = (-1 / J) * (c1 * R ^ 2 * x[1] + k1 * x[1] + k2 * (R * x[1] + x[3]) * R)
    dx[3] = (1 / c2) * (f - k2 * (R * x[1] + x[3]))
end

# main.jl
t = (0.0, 10.0)
p = (10.0, 10.0, 8.0, 10.0, 15.0, 1.0)
x0 = [0.0, 0.0, 0.0]

problem = ODEProblem(diferencijalneJednačine!, x0, t, p)
rešenje = solve(problem)

plot(rešenje)

# pod d)
x1 = [x[1] for x in rešenje.u]
x3 = [x[3] for x in rešenje.u]

plot(rešenje.t, [x1, x3], label = ["x1" "x3"])

# pod e
x2 = [x[2] for x in rešenje.u]
ugaono_ubrzanje_m = diff(x2) ./ diff(rešenje.t)

~, idx1 = findmax(abs.(ugaono_ubrzanje_m))

plot(rešenje.t[1:end-1], ugaono_ubrzanje_m, label = "ugaono_ubrzanje_m", yticks = -1:0.02:1)
plot!([rešenje.t[idx1]], [ugaono_ubrzanje_m[idx1]], markershape = :o, label = "max ugaono_ubrzanje_m")
