using LinearAlgebra, Plots, DifferentialEquations

function signal(t)
    tp = rem.(t, 2)

    y = ((5 * tp) .* (tp .< 1)) + 
        ((-5 * tp .+ 10) .* (tp .>= 1))
end

function diferencijalneJednačine!(dx, x, p, t)
    m1, m2, c1, c2, c3, k1, k2 = p
    f = signal(t)

    dx[1] = x[2]
    dx[2] = -1 / m1 * (c1 * x[2] + k1 * x[1] + k2 * (x[1] - x[3]))
    dx[3] = x[4]
    dx[4] = 1 / m2 * (f + k2 * (x[1] - x[3]) - x[4] * (c2 + c3))
end

# main.jl
t = (0.0, 20.0)
p = (20.0, 10.0, 10.0, 10.0, 10.0, 20.0, 40.0)
x0 = [1.0, 0.0, 2.0, 0.0]

problem = ODEProblem(diferencijalneJednačine!, x0, t, p)
rešenje = solve(problem)

plot(rešenje)

# pod d)
v1 = [x[2] for x in rešenje.u]
v2 = [x[4] for x in rešenje.u]

~, index1 = findmax(abs.(v1))
~, index2 = findmax(abs.(v2))

plot(rešenje.t, [v1 v2], lw = 2, label = ["v1(t)" "v2(t)"])
plot!([rešenje.t[index1]], [v1[index1]], label = "max v1", markershape = :x, color = :green)
plot!([rešenje.t[index2]], [v2[index2]], label = "max v2", markershape = :x, color = :red)

# pod e)
pozicija1 = [x[1] for x in rešenje.u]
pozicija2 = [x[3] for x in rešenje.u]

put1 = sum(abs.(diff(pozicija1)))
put2 = sum(abs.(diff(pozicija2)))

println("Predjeni put prvog tela je: ", put1, "\nPredjeni put drugog tela je: ", put2)