function rasporediPrvoKolo(teniseri)
    polovina = Int(floor(length(teniseri) / 2))
    kraj = length(teniseri)

    for i in 1:polovina
        @printf("%2i. PAR: %-15s %-15s %3i \tIGRA PROTIV\t", i, teniseri[i].ime, teniseri[i].prezime, teniseri[i].brojPoena)
        @printf("%-15s %-15s %3i\n", teniseri[kraj].ime, teniseri[kraj].prezime, teniseri[kraj].brojPoena)
        kraj -= 1
    end
end