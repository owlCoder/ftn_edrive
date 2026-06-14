function DFS!(G, p, k)
   if G.V[p].type == 'Z' || G.V[k].type == 'Z'
      error("Cilj/Početak ne može biti zid!")
   end
   
   # inicijalizacija cvorova za obilazak
   for u = 1:length(G.V)
      G.V[u].color = 'W'
   end
   
   # poziv za pretragu puta od pocetnog do krajnjeg cvora
   return DFS_Visit!(G, p, k)
end

function DFS_Visit!(G, p, k)
   # trazimo put od cvora p do cvora k
   path = Int[]
   # ako smo stigli do krajnjeg cvora, 
   # vracamo putanju sa tim cvorom kao rezultat
    if p == k 
        path = [p]
        return path
    end
   
    # trazimo putanju preko susednih cvorova
    G.V[p].color = 'G';
   for v in findall(G.AdjMatrix[p,:] .== 1)
      if G.V[v].color == 'W' && G.V[v].type  != 'Z' || G.V[v].type  == 'K'
            path = DFS_Visit!(G, v, k);

         # ako je nadjen put od suseda do krajnjeg cvora 
         # taj put prosirujemo sa trenutnim cvorom i prekidamo pretragu
         if length(path) != 0
            return [p; path]
         end   
      end
   end
    G.V[p].color = 'B'
    return path
end 

function brojKovčegaNaPutu(G, path)
   brojac = 0
   for i = path
      if G.V[i].type == 'K'
         brojac += 1
      end
   end
   println("\nBroj kovčega na datoj putanji je $brojac.")
end