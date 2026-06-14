# Zadatak 6.1. Implementirati Selection sort u Julia-i koji sortira elemente niza brojeva
# u opadajućem redosledu. Pronaći najveću razliku između dva susedna broja u
# sortiranom nizu

include("selectionSort.jl")

A = [2 5 19 7 14 9 1 22 8]

selectionSort!(A)
println("Sortirani niz izgleda ovako: $A")

maxRazlika = A[1] - A[2]
n = length(A)

  for i=2:n - 1
      if A[i]-A[i + 1] > maxRazlika
        global maxRazlika = A[i] - A[i + 1]
      end 
  end

println("\nNajveca razlika je: $maxRazlika")