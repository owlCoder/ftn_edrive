using LinearAlgebra, Plots, DifferentialEquations

function signal(t)
    tp = rem.(t, 8)

    y1 = 0.5
    y2 = sin.(2 * pi / 8 * t) .* (tp .<= 4)

    y = min.(y1, y2)
end

# grafik kao iz postavke zadatka
# t = 0:0.001:20
# plot(t, signal(t), xticks = 0:20, lw = 2)
# plot!(t, (sin.(1 / 4 * pi * (rem.(t, 8))) .* (rem.(t, 8) .< 4)), line =:dash)

function diferencijalneJednačine!(dx, x, p, t)
    m1, m2, c, k1, k2, R = p  
    f = signal(t)
    J = 1 / 2 * m1 * R ^ 2

    dx[1] = x[2]
    dx[2] = (-1 / J) * (c * R ^ 2 * x[2] + k1 * x[1] + k2 * (R * x[1] + x[3]) * R)
    dx[3] = x[4]
    dx[4] = (-1 / m2) * (k2 * (R * x[1] + x[3]) - f)
end

# main.jl
t = (0.0, 20.0)
p = (10.0, 5.0, 10.0, 10.0, 15.0, 1.0)
x0 = [2.0, 0.0, 0.0, 0.0]

problem = ODEProblem(diferencijalneJednačine!, x0, t, p)
rešenje = solve(problem)

plot(rešenje)

# pod d)
# odrediti promenu ugaonog ubrzanja diska u vremenu, i prikazati na istom grafiku
# promenu ugaone brzine i ubrzanja
x2 = [x[2] for x in rešenje.u]
ugaono_ubrzanje = diff(x2) ./ diff(rešenje.t)
# iscrtati x2 (promena ugaone brzine)

plot(rešenje.t[1:end-1], ugaono_ubrzanje, lw = 2, label = "a(t)")
plot!(rešenje.t, x2, lw = 2, label = "θ'(t)")

# pod e)
x3 = [x[3] for x in rešenje.u]
x4 = [x[4] for x in rešenje.u]
    
plot(rešenje.t, [x3, x4], lw = 2, label = ["Δx_m2" "Δv_m2"])
