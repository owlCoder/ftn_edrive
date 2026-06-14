mutable struct Cvor
    color::Char
    type::Char
    d::Int
    pred::Int
end
mutable struct labyrinth
   rows::Int64
   cols::Int64
   AdjMatrix::Array{Int, 2}
   V::Array{Cvor, 1}
end

function generateTableAdjMatrix(nbRows, nbColumns)
    adjMatrix = zeros(nbRows*nbColumns, nbRows*nbColumns);
    adjMatrixRowCounter = 0;
    
    for i = 1:nbRows
       for j = 1:nbColumns
           currentId = (i-1)*nbColumns + j;
           neighbourRow = [currentId-1 currentId currentId+1];
           neighbourMatrix = [neighbourRow .- nbColumns; neighbourRow; neighbourRow .+ nbColumns];

           startRowIndex = 1;
           startColumnIndex = 1;
           endRowIndex = 3;
           endColumnIndex = 3;

           if i == 1
               startRowIndex = 2;
           end
           if j == 1
               startColumnIndex = 2;
           end
           if i == nbRows
              endRowIndex = 2;
           end
           if j == nbColumns
              endColumnIndex = 2; 
           end

	   neighbours = [];
           for m = startRowIndex:endRowIndex
              for n = startColumnIndex:endColumnIndex
                  if neighbourMatrix[m,n]!=currentId
                    push!(neighbours, neighbourMatrix[m,n]);
                  end
              end
           end

           adjRow = zeros(1, nbRows*nbColumns);
           for m = 1:length(neighbours)
                adjRow[neighbours[m]] = 1;
           end
           
           adjMatrixRowCounter  = adjMatrixRowCounter + 1;           
           adjMatrix[adjMatrixRowCounter, :] = adjRow;          
       end
    end
    return adjMatrix
end

function emptyLabyrinth(nrow, ncol)
   AdjMatrix = generateTableAdjMatrix(nrow, ncol)
   V = Array{Cvor}(undef, nrow*ncol)
   for i in 1:nrow*ncol
     V[i] = Cvor('W', '*', 0, 0)
   end
   return labyrinth(nrow, ncol, AdjMatrix, V)
end

function printLabyrinthType(G)
  for i in 1:G.rows
    for j in 1:G.cols
      print(" $(G.V[(i-1)*G.cols+j].type)")
    end
  println()
  end
end

function printLabyrinthColor(G)
  for i in 1:G.rows
    for j in 1:G.cols
      print(" $(G.V[(i-1)*G.cols+j].color)")
    end
  println()
  end
end

function defineNodesType!(G, nodes, type )
    for u = nodes
        G.V[u].type = type;
    end
end

function printLabyrinthPath(G, path)
  for i in 1:G.rows
    for j in 1:G.cols
       if ((i-1)*G.cols+j) in path
         print(" *")
       else 
         print(" $(G.V[(i-1)*G.cols+j].type)")
       end
    end
  println()
  end
end
