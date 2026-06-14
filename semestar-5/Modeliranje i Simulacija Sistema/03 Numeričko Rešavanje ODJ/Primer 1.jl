# Prvi korak - Dodavanje potrebnih paketa
using DifferentialEquations
using Plots

# Drugi korak - Opis problema pomocu funkcije
funkcija(u, p, t) = sin(t)

# Treci korak - Definisanje svih poznatih informacija
u0 = 0.0
tspan = (0.0, 10.0) # potrebno je da granice opsega budu racionalni brojevi!

# Cetvrti korak - Pozivanje funkcije ODEProblem
problem = ODEProblem(funkcija, u0, tspan)

# Peti korak - Odredjivanje resenja diferencijalne jednacine
resenje = solve(problem)

# Sesti korak - Prikaz resenja i analiza
plot(resenje)