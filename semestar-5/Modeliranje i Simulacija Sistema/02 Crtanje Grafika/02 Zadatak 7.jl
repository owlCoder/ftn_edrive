using Plots

t = 0:0.001:2
y = sqrt.(1 .- ((t .- 1) .^ 2))

plot(t, y, xticks=0:2, label="kruznica")
