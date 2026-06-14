function binarnaPretraga(takmičari, key)
    početak = 1
    kraj = length(takmičari)

    while početak <= kraj
        sredina = Int(floor( (početak + kraj) / 2))

        if takmičari[sredina].ime == key
            return sredina
        elseif takmičari[sredina].ime < key
            početak = sredina + 1
        else
            kraj = sredina - 1
        end
    end
    return -1
end