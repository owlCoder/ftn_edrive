using LinearAlgebra, Plots, DifferentialEquations

function signal(t)
        tp = rem.(t, 5)

        y1 = (( 4 * tp) .* (tp .< 1)) .+ (4 .* ((tp .>= 1) .& (tp .< 2)))
        y2 = ((-2 * tp .+ 8) .* ((tp .>= 2) .& (tp .< 3)))
        y3 = (( 2 * ((tp .>= 3) .& (tp .< 4)))) .+ ((-2 * tp .+ 10) .* (tp .>= 4))

        y = y1 + y2 + y3
end

function diferencijalneJednačine!(dx, x, p, t)
    m1, m2, c1, c2, c3, k1, k2 = p
    f = signal(t)

    dx[1] = x[2]
    dx[2] = -1 / m1 * (-f + c1 * (x[2] - x[4]) + k1 * x[1])
    dx[3] = x[4]
    dx[4] = -1 / m2 * (-c1 * (x[2] - x[4]) + (c2 + c3) * x[4] + k2 * x[3])
end

# main.jl
t = (0.0, 10.0)
p = (10.0, 15.0, 20.0, 20.0, 20.0, 40.0, 40.0)
x0 = [0.0, 0.0, 0.0, 0.0]

problem = ODEProblem(diferencijalneJednačine!, x0, t, p)
rešenje = solve(problem)

# pod d)
pozicija1 = [x[1] for x in rešenje.u]
pozicija2 = [x[3] for x in rešenje.u]

~, index1 = findmax(abs.(pozicija1))
~, index2 = findmax(abs.(pozicija2))

plot(rešenje.t, [pozicija1, pozicija2], lw = 2, xticks = 0:10)
plot!([rešenje.t[index1]], [pozicija1[index1]], markershape = :o, color = :red, lw = 2, label = "max poz1")
plot!([rešenje.t[index2]], [pozicija2[index2]], markershape = :o, color = :green, lw = 2, label = "max poz2")

# pod e)
put1 = sum(abs.(diff(pozicija1)))
put2 = sum(abs.(diff(pozicija2)))

println("Predjeni put prvog tela iznosi: ", put1, "\nPredjeni put drugog tela iznosi: ", put2)
