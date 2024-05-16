using Distributions
using Plots
include("Merge-Sort.jl")
using .mergeSort
include("bubble_sort.jl")
using .buble


"""
    Produza o gráfico que representa a taxa de crescimento 
    dos tempos de execução prevista teoricamente para o melhor 
    cenário e para o pior cenário.
"""


function merge_plot(tempo_cenario, amostra, inicio, tamanho_da_entrada, tipo="pior")

    for i in 1:amostra
        arr = collect(1:inicio)

        if tipo == "pior"
            sort!(arr, rev=true)
        end

        p = 1
        r = length(arr)
        q = trunc(Int, length(arr) / 2)

        tempo_initial = time()
        mergeSort.merge_Sort(arr, p, q, r)
        tempo_final = time()
        tamanho_da_entrada[i] = inicio
        inicio += 500

        tempo_cenario[i] = tempo_final - tempo_initial 
    end
end

# Define os parâmetros
amostra = 100
inicio = 5000

# Gera os tempos de execução
tempo_melhor_cenario = zeros(amostra) # guarda o tempo de execução do melhor cenário
tempo_pior_cenario = zeros(amostra) # guarda o tempo de execução do pior cenário
tamanho_da_entrada = zeros(Int, amostra) #Vai guarda os tamanhos das entradas para calcular a taxa  de crescimento dos tempos de execução

# Chama a função merge
#merge_plot(tempo_melhor_cenario, amostra, inicio, tamanho_da_entrada)
#merge_plot(tempo_pior_cenario, amostra, inicio, tamanho_da_entrada)

#Gera os gráficos
#x = range(1, length=amostra)
#plot(x, [tempo_melhor_cenario tempo_pior_cenario], label=["melhor cenario" "pior cenario"], lw=2)

"""
    Determine, para uma tabela de valores de vírgula flutuante aleatória, 
    com distribuição uniforme no intervalo entre -100.0 e 100.0, qual a 
    dimensão n , em que o algoritmo Merge-Sort() executa 1000 x mais 
    rápido que o algoritmo Bubble-Sort().
"""

# Função para gerar uma tabela de valores aleatórios
function criar_tabela(n)
    return rand(Float64, n) .* 200.0 .- 100.0
end

# Determinação da dimensão em que o Merge-Sort é 1000 vezes mais rápido que o Bubble-Sort
function findDimension()
    n = 10

    while true
        arr_merge =  criar_tabela(n)
        arr_buble =  copy(arr_merge)
        p = 1
        r = length(arr_merge)
        q = trunc(Int, length(arr_merge) / 2)

        time_initial_merge = time()
        mergeSort.merge_Sort(arr_merge, p, q, r)
        time_final_merge = time()

        time_initial_buble = time()
        buble.bubble_sort(arr_buble)
        time_final_buble = time()

        merge_sort_time = time_final_merge - time_initial_merge
        bubble_sort_time = time_final_buble - time_initial_buble

        if merge_sort_time < bubble_sort_time / 1000
            return n
        end
        n += 1
    end
end

# Chamada da função para encontrar a dimensão
dimension = findDimension()
println("Dimensão em que o Merge-Sort é 1000 vezes mais rápido que o Bubble-Sort: $dimension")