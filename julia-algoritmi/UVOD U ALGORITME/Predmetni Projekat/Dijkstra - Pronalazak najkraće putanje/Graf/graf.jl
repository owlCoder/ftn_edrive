const W = 1   # beli čvor
const G = 2   # sivi čvor
const B = 3   # crni čvor

#  čvor u grafu
mutable struct Čvor
	ključ::Int64     	          	 # podatak
	boja::Int8                   	 # koje boje je čvor
	prethodni::Union{Nothing, Čvor}  # prethodni čvor
	udaljenost::Float64			  	 # rastojanje između čvorova
	susedi::Array{Čvor, 1}			 # susedni čvorovi
end

Čvor(ključ::Int64) = Čvor(ključ, W, nothing, Inf, [])

# graf
mutable struct Graf
	V::Dict{Int32, Čvor}
	težina::Dict{Tuple{Int32, Int32}, Float64}
end

Graf() = Graf(Dict{Int32, Čvor}(), Dict{Tuple{Int32, Int32}, Float64}())

function dodajVezeTežine!(Graf::Graf, veze, usmeren = true)
	for (u, v, težina) in veze 
		čvor_u = get!(Graf.V, u, Čvor(u))
		čvor_v = get!(Graf.V, v, Čvor(v))

		push!(čvor_u.susedi, čvor_v)
		Graf.težina[(u, v)] = težina

		if !usmeren
			push!(čvor_v.susedi, čvor_u)
			Graf.težina[(v, u)] = težina
		end
	end
end

function getTežina(Graf::Graf, u::Čvor, v::Čvor)
	return Graf.težina[u.ključ, v.ključ]
end

# Početni čvor ima vrednost udaljenosti je 0, dok svi
# ostali čvorovi imaju Inf vrednost udaljenosti 
function početneVrednosti!(Graf::Graf, sekundarni::Čvor)
	for u in values(Graf.V)
		u.boja = W
		u.udaljenost = Inf
		u.prethodni = nothing
	end
	sekundarni.udaljenost = 0
end

# Oslobađanje ivica -> ako postoji ivica iz u ka v,
# trenutno najkraći put iz početka ka u
function relaksacija!(Graf::Graf, u::Čvor, v::Čvor)
	tezina = getTežina(Graf, u, v)

	if v.udaljenost > (u.udaljenost + tezina) # udaljenost u može dobiti vrednost sume Graf.V[v].d i
		v.udaljenost = u.udaljenost + tezina  # težine ivice (u, v)
											  # Njegova dužina će iznositi d[u] + w(u, v), ukoliko je 
											  # vrednost manja od d[v]
		v.prethodni = u
		return true
	end
	return false
end