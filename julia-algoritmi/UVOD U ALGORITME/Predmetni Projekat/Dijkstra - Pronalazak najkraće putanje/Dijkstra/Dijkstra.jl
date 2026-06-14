# Dijkstra.jl
# Koristi se modul graf.jl prilagođen temi zadatka!
# Autor: PR55-2020 Danijel Jovanović

# Dijkstra algoritam -> baziran na pamćenju vrednosti d[v] trenutnog
# najkraćeg puta od početnog čvora do svih ostalih čvorova.
function Dijkstra!(Graf::Graf, sekundarniKljuč::Int32)    
    function pronadjiMinimum!(Q)            # Funkcija koja pronalazi čvor iz skupa Q koji ima najmanju
        D = map(id -> Graf.V[id].udaljenost, Q)
        indeks = argmin(D)                  
        id = Q[indeks]
        Q[indeks] = Q[end]
        pop!(Q)                             # vrednost udaljenosti i izbacuje ga iz skupa Q.
        
        return id
    end  
                                           
    početneVrednosti!(Graf, Graf.V[sekundarniKljuč]) 
                                            # Početni čvor ima vrednost udaljenosti je 0, dok svi
                                            # ostali čvorovi imaju Inf vrednost udaljenosti 

    Graf.V[sekundarniKljuč].boja = G
                                            # Potrebno je izdvojiti 2 skupa čvorova: S i Q.
    S = []                                  # U skupu S su oni čvorovi za koje je poznata
                                            # vrednost udaljenosti. Skup S je na početku prazan!
    Q = collect(keys(Graf.V))               # U skupu Q su svi ostali.

    while length(Q) > 0
        u = Graf.V[pronadjiMinimum!(Q)]     # Prilikom svake iteracije, jedan čvor se premešta
                                            # iz skupa Q u skup S.
                                            # To je onaj čvor koji ima najmanju vrednost udaljenosti.
        u.boja = G
        push!(S, u)

        for v in u.susedi
            relaksacija!(Graf, u, v)        # Oslobađanje ivica -> ako postoji ivica iz u ka v,
                                            # trenutno najkraći put iz početka ka u
                                            # udaljenost u može dobiti vrednost sume Graf.V[v].d i
                                            # težine ivice (u, v)
                                            # Njegova dužina će iznositi d[u] + w(u, v), ukoliko je 
                                            # vrednost manja od d[v]
                                            # Proces oslobađanja ivica se nastavlja sve dok vrednost 
                                            # d[v] ne određuje najkraći put iz početnog čvora u v.
        end
        u.boja = B
    end

    # Funkcija koja za svaku putanju od referentnog do i-tog čvora 
    # pamti koliko je taj čvor udaljen od početnog (referentnog čvora)
    function putanje(Graf)
        udaljeni = Float64[]
        for (id, u) in g.V
            push!(udaljeni, u.udaljenost)
        end

        return udaljeni
    end
    return Graf, putanje(Graf)
end