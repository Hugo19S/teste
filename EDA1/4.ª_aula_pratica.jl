include("HeapSort.jl")
using .Heap
using Distributions
using Plots

A = [14, 18, 4, 10, 5, 3, 2, 67, 8]

heapSort(A)

function heap_sort_plot(tempo_cenario, amostra, inicio, tamanho_da_entrada, tipo="pior")

    for i in 1:amostra
        time_array = zeros(Float64, amostra)

        for j in amostra
            arr = collect(1:inicio)

            if tipo == "pior"
                sort!(arr, rev=true)
            end

            tempo_all = @elapsed Heap.heapSort(arr)
            tamanho_da_entrada[i] = inicio
            time_array[j] = tempo_all
        end
        inicio += 100000
        tempo_cenario[i] = mean(time_array)
    end
end

# Define os parâmetros
amostra = 25
inicio = 500000

# Gera os tempos de execução
tempo_melhor_cenario = zeros(amostra) # guarda o tempo de execução do melhor cenário
tempo_pior_cenario = zeros(amostra) # guarda o tempo de execução do pior cenário
tamanho_da_entrada = zeros(Int, amostra) #Vai guarda os tamanhos das entradas para calcular a taxa  de crescimento dos tempos de execução

# Chama a função merge
heap_sort_plot(tempo_melhor_cenario, amostra, inicio, tamanho_da_entrada)
heap_sort_plot(tempo_pior_cenario, amostra, inicio, tamanho_da_entrada, "melhor")

#Gera os gráficos
x = range(1, length=amostra)
#plot(x, [tempo_melhor_cenario tempo_pior_cenario], label=["melhor cenario" "pior cenario"], lw=2)
plot(tamanho_da_entrada, [tempo_melhor_cenario tempo_pior_cenario], label=["melhor cenario" "pior cenario"], lw=2)



####################Falta por fazer####################