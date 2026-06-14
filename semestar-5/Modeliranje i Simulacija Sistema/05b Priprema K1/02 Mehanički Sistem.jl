using Plots, DifferentialEquations, LinearAlgebra

function signal(t)
    tp = rem.(t, 5)

    y = (2 .* tp) .* (tp .< 2) .+
        (4 .* ((tp .>= 2) .& (tp .< 4)))
end

function sistem!(dx, x, p, t)
   m1, m2, m3, R, k1, c1, c2, c3, g = p
   f = signal(t)
   J = 1 / 2 * m1 * R ^ 2
   
   dx[1] = x[2]
   dx[2] = (-1 / J) * (c2 * (x[4] + R * x[2]) * R - k1 * (x[5] - R * x[1]) * R)
   dx[3] = x[4]
   dx[4] = (-1 / m2) *  (x[4] * (c1 + c3) + c2 * (x[4] + R * x[2]) + m2 *g)
   dx[5] = x[6]
   dx[6] = (- 1 / m3) * (m3 * g + k1 * (x[5] - R * x[1]) - f)
end

# main.jl
t = (0.0, 10.0)
p = (5.0, 5.0, 5.0, 2.0, 6.0, 4.0, 4.0, 4.0, 9.81)
x0 = [0.0, -4.0, 0.0, 0.0, 0.0, 0.0]

prob = ODEProblem(sistem!, x0, t, p)
sol  = solve(prob)

plot(sol)

# c
p = [x[1] for x in sol.u]
delta_p = sum(abs.(diff(p)))

# d
v1 = [x[2] for x in sol.u]
~, idx1 = findmax(abs.(v1))

plot(sol.t, v1)
plot!([sol.t[idx1]], [v1[idx1]], markershape = :o)