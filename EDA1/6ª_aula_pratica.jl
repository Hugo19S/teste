"""5.1 a) Implemente os mecanismos de operação duma pilha.""" 

include("Pilhas.jl")
using .Pilha

"""5.2 a) Implemente os mecanismos de operação duma fila de espera."""

include("Queue.jl")
using .FilaEspera

"""5.1 b) Exemplifique a operação duma pilha com números inteiros. Por exemplo 100 números aleatórios."""

N = 100

S = Pilha.Stack(N, [rand(0:N) for i in 1:N])


for i in 1:90
    Pilha.pop(S)
end

for i in 1:90
    Pilha.push(S, "a$i")
end

"""5.2 b) Escreva os testes ao funcionamento da fila de espera."""

queue = FilaEspera.Queue(1, 1, [0 for i in 1:5], false)

println(queue)
#println(length(queue.mem))
println()

FilaEspera.enQueue(queue, "A") # Testando se Ana entrou na fila
#println(queue)
FilaEspera.enQueue(queue, "B") # Testando se Ana entrou na fila
#println(queue)
FilaEspera.enQueue(queue, "C") # Testando se Ana entrou na fila
#println(queue)
FilaEspera.enQueue(queue, "D") # Testando se Ana entrou na fila
#println(queue)
FilaEspera.enQueue(queue, "E") # Testando se Ana entrou na fila
#println(queue)
FilaEspera.deQueue(queue) # Testando se Ana entrou na fila
#println(queue)
FilaEspera.enQueue(queue, "F") # Testando se Ana entrou na fila
#println(queue)

#FilaEspera.deQueue(queue) # Testando se Ana entrou na fila
#FilaEspera.deQueue(queue) # Testando se Ana entrou na fila
#FilaEspera.deQueue(queue) # Removendo um cliente da fila
#FilaEspera.deQueue(queue) # Removendo um cliente da fila
#FilaEspera.enQueue(queue, "igy") # Testando se Ana entrou na fila
#println(queue)
#println(queue.mem)