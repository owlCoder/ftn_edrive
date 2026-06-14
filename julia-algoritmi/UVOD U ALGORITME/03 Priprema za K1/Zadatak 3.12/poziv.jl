include("program.jl")

@test suma_n_brojeva_petlja(5)  == suma_n_brojeva_bez_petlje(5)
@test suma_n_brojeva_petlja(10) == suma_n_brojeva_bez_petlje(10)
@test suma_n_brojeva_petlja(25) == suma_n_brojeva_bez_petlje(25)