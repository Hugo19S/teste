"""5.1 a) Implemente os mecanismos de operação duma pilha.""" 

include("Stack.jl")
using .Pilha

"""5.2 a) Implemente os mecanismos de operação duma fila de espera."""

include("Queue.jl")
using .FilaEspera

"5.3 Listas Ligadas"

include("DoubleLinkedList.jl")
using .DoubleLinked

"5.4 Gestão da Memória"



"5.5 Árvores Binárias"



#########################################################

"""5.1 b) Exemplifique a operação duma pilha com números inteiros. Por exemplo 100 números aleatórios."""

N = 100

arr = Pilha.Stack(N)

println("##################################################################################################")
println(arr)

for i in 1:N
    Pilha.push(arr, i)
end

for i in 1:N
    Pilha.pop(arr)
end

#########################################################
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
#########################################################
"5.3 a) teste o suporte a listas ligadas em Julia."

# Criando a lista duplamente ligada
L = DoubleLinked.DoublyLinkedList{Int}(nothing, nothing)

# Criando nós
node1 = DoubleLinked.ListNode{Int}(10, nothing, nothing)
node2 = DoubleLinked.ListNode{Int}(20, nothing, nothing)
node3 = DoubleLinked.ListNode{Int}(30, nothing, nothing)

# Inserindo nós na lista
DoubleLinked.listInsert(L, node1)
DoubleLinked.listInsert(L, node2)
DoubleLinked.listInsert(L, node3)

println(L)

# Buscando um nó na lista
println("Buscando nó com chave 20:")
foundNode = DoubleLinked.listSearch(L, 20)
if foundNode !== nothing
    println("Nó encontrado: ", foundNode.key)
else
    println("Nó não encontrado")
end

# Removendo um nó da lista
println("Removendo nó com chave 20:")
DoubleLinked.listDelete(L, foundNode)
println(L)

# Verificando se o tail foi atualizado corretamente
#if L.tail !== nothing
#    println("Tail da lista: ", L.tail.key)
#else
#    println("Tail da lista: Nothing")
#end

#########################################################
"5.4 Gestão da Memória

a) programe o sistema de gestão de memória para múltiplas listas ligadas de inteiros."


#########################################################
"5.4 Gestão da Memória

b) programe as funções necessárias para usar listas ligadas."


#########################################################
"5.5 Árvores Binárias

a) programe o sistema de gestão de memória para árvores binárias."


#########################################################
"5.5 Árvores Binárias

b) teste o funcionamento das árvores binárias."


#########################################################
"5.6 Árvores n-árias

a) programe o sistema de gestão de memória de árvores n-árias."


#########################################################
"5.6 Árvores n-árias

b) teste o seu funcionamento"