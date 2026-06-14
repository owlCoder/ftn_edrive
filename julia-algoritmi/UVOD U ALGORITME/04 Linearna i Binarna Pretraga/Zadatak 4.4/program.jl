# Zadatak 4.4 Neka je dat niz košarkaša sortiran rastuće po visini. Implementirati
# algoritam koji pronalazi koliko košarkaša ima datu visinu. Za svakog košarkaša
# zapamtiti ime, prezime, visinu i poziciju na kojoj igra. Modifikovati algoritam binarne
# pretrage. 

function binarnoPretraži(A, visina)
    početak = 1
    kraj = length(A)

    while početak <= kraj
        sredina = Int(floor( (početak + kraj) / 2))

        if A[sredina].Visina == visina
            return sredina
        elseif A[sredina].Visina > visina
            kraj = sredina - 1
        else
            početak = sredina + 1
        end
    end

    return -1
end


