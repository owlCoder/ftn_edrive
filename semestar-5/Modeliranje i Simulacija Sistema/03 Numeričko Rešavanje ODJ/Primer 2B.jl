using Plots
using DifferentialEquations

function primer_2!(dz, z, p, t)
    mi = p

    dz[1] = z[2]
    dz[2] = mi * (1 - z[1] ^ 2) * z[2] - z[1]
end

z0 = [0.25, 0.25]
tspan = (0.0, 30.0)

problem = ODEProblem(primer_2!, z0, tspan, 1)
resenje = solve(problem)

# iscrtava oba signala
# plot(resenje)

z1 = [pn[1] for pn in resenje.u]
z2 = [pn[2] for pn in resenje.u]

plot(resenje.t, z1)