#== Zadatak 8.3 Napisati program koji u lavirintu pronalazi i ispisuje broj soba
(ostrva) koristći BFS algoritam. Pod jednom sobom se podrazumevaju sva
polja do kojih je moguće doći počevši od bilo kojeg elementa te sobe.
– Ideja: Pogledati zadatak 7.3. Kreirati funkcije BFS i BFS_visit, pri čemu
BFS vrši inicijalizaciju i pokreće po jednom BFS_visit za svaku sobu. ==#

include("labyrinth.jl")
include("BFS_rec.jl")


function printLabyrinthIsle(G)
    for i in 1:G.rows
      for j in 1:G.cols
        print(" $(G.V[(i-1)*G.cols+j].d)")
      end
    println()
    end
  end

redovi = 8;
kolone = 8;
G = emptyLabyrinth(redovi, kolone);

# kreiramo lavirint
defineNodesType!(G, 1:(redovi * kolone), 'P');
defineNodesType!(G, [5 9 10 11 12 13 15 21 22 23 24 26 28 29 31 32 33 34 37 43 44 45 46 47 50 51 55 58 60 61 63], 'Z')

BFS!(G)
printLabyrinthType(G)
println("\n\n")
printLabyrinthIsle(G)
