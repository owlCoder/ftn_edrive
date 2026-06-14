using DifferentialEquations, Plots, LinearAlgebra

function pobuda(t)
    tp = rem.(t, 4)
    y = 2 * (abs.(sin.(2 * pi / 4 * t) .* ((tp .>= 2) .& (tp .<= 4))))
end

function sistem!(dx, x, p, t)
    m1, m2, c1, c2, c3, k1, k2, R, g = p
    f = pobuda(t)
    J = 1 / 2 * m2 * R ^ 2

    dx[1] = x[2]
    dx[2] = (-1 / m1) * (x[2] * (c1 + c2) + k1 * x[1] + k2 * (x[1] - R * x[3]))
    dx[3] = x[4]
    dx[4] = (-1 / J) * (c3 * R ^ 2 * x[4] - k2 * (x[1] - R * x[3]) * R)
end

# main.jl
t = (0.0, 16.0)
p = (10.0, 10.0, 40.0, 20.0, 20.0, 40.0, 40.0, 0.5, 9.81)
x0 = [2.0, 0.0, 0.0, 0.0]

prob = ODEProblem(sistem!, x0, t, p)
sol  = solve(prob)

plot(sol)

# pod d
v1 = [x[2] for x in sol.u]
~, idx1 = findmax(abs.(v1))

plot([sol.t], [v1])
plot!([sol.t[idx1]], [v1[idx1]], markershape = :o)

# pod e
x4 = [x[4] for x in sol.u]
ugaono_ubrzanje_disk = diff(x4) ./ diff(sol.t)

plot(sol.t[1:end-1], ugaono_ubrzanje_disk, xlims = (0.0, 10.0))