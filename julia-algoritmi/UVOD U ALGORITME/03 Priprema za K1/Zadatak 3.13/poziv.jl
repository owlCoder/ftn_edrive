include("program.jl")

@test proizvod_n_neparnih(5)  == 15
@test proizvod_n_neparnih(10) == 945
@test proizvod_n_neparnih(25) == 7905853580625