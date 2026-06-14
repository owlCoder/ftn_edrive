using Plots

function rampa(t)
    return (t .* (t .>= 0))
end

function h(t)
    return (1 .* (t .>= 0))
end

t = 0:0.01:4

# main.jl
y = -2 * h(t) + 4 * h(t .- 1) - 2 * rampa(t .- 1) + 4 * rampa(t .- 2) - 2 * rampa(t .- 3) - 4 * h(t .- 3) + 2 * h(t .- 4)
plot(t, y, lw = 2)