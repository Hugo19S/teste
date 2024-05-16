include("Quick_Sort.jl")
include("Merge-Sort.jl")
using .mergeSort
using .Quicksort
using Plots

"""
4.2 
Compare experimentalmente o desempenho computacional do algoritmo Quick-Sort com o algoritmo Merge-Sort. 
Meça os tempos de execução e meça as necessidades de memória. Produza os gráficos correspondentes.
"""

# Função para medir o tempo e memória
function measure_performance(algorithm, A, type)
    p = 1
    r = length(A)
    q = trunc(Int, length(A) / 2)

    #mem = Base.summarysize(A)
    

    if type == "merge"
        mem =  @allocated algorithm(copy(A), p, q, r)
        time = @elapsed algorithm(A, p, q, r)
    else
        mem = @allocated(algorithm(copy(A), p, r))
        time = @elapsed algorithm(A, p, r)
    end

    return time, mem
end

# Função para gerar arrays aleatórios de tamanho n
function generate_array(n)
    return rand(Float64, n) .* n
end

inicoArray = 1000
dim = 20
arrayTimeMerge = Array{Float64}(undef, dim)
arrayTimeQuick = Array{Float64}(undef, dim)
memorieMerge = Array{Float64}(undef, dim)
memorieQuick = Array{Float64}(undef, dim)
tamanhoEntrada = Array{Float64}(undef, dim)

for i in 1:dim

    array1 =  generate_array(inicoArray)
    array2 =  copy(array1)

    exec = measure_performance(Quicksort.quicksort, array1, "quick")
    exec2 = measure_performance(mergeSort.merge_Sort, array2, "merge")

    arrayTimeMerge[i] = exec2[1]
    arrayTimeQuick[i] = exec[1]
    memorieMerge[i] = exec2[2]
    memorieQuick[i] = exec[2]

    #=for j in range(25)
        
    end=#
    tamanhoEntrada[i] = inicoArray
    global inicoArray += 5000
end

plot(tamanhoEntrada, [arrayTimeMerge arrayTimeQuick memorieMerge memorieQuick], 
        label=["tempo do Merge" "Tempo do Quick" "Memoria do Merge" "Memoria do Quick"], lw=2)
