#module DoubleLinked

#using Revise

includet("Stack.jl")
using .Pilha

#export ListNode, DoubleLinked, listInsert, listDelete, listSearch

mutable struct MemoryDoubleLinkedList
    key::Array{Int16}
    prev::Array{Int16}
    next::Array{Int16}
    free::Stack
    NIL
end

"""
    MemoryDoubleLinkedList( n )
construtor de memória para n posições
"""
function MemoryDoubleLinkedList( n )
    S = Stack( n )
    for x::Int16 = 1:n
        push(S, x)
    end
    MemoryDoubleLinkedList( zeros(Int16,  n ),
                            zeros(Int16,  n ),
                            zeros(Int16,  n ),
                            S,
                            1 )

end

"""
    allocateObject( mem )

reserva memória para um objeto da lista duplamente ligada
"""
function allocateObject( mem::MemoryDoubleLinkedList )
    pop( mem.free )
end

"""
    freeObject( mem )

liberta memória para um objeto da lista duplamente ligada
"""
function freeObject( mem::MemoryDoubleLinkedList, x )
    push( mem.free, x )
end

const NIL = 0

"""
    DoubleLinkedList

representação de lista duplamente ligada
"""
mutable struct DoubleLinkedList
    mem::MemoryDoubleLinkedList
    head

    DoubleLinkedList( mem::MemoryDoubleLinkedList ) = new( mem, NIL )
end

"""
    list_insert!( l::DoubleLinkedList, key )
    inserção dum elemento da lista com o valor key
"""
function listInsert( l::DoubleLinkedList, key )
    x = allocateObject( l.mem )
    l.mem.key[ x ] = key
    
    l.mem.next[ x ] = l.head
    if l.head != NIL
        l.mem.prev[ l.head ] = x
    end
    l.head = x
    l.mem.prev[ x ] = NIL
end

"""
    list_delete!( l, x )
remove um elemento da lista na posição x da memória
"""
function listDelete( l, x )
    if l.mem.prev[ x ] != NIL
       l.mem.next[ l.mem.prev[ x ]] = l.mem.next[ x ] 
    else
        l.head = l.mem.next[ x ]
    end
    if l.mem.next[ x ] != NIL
        l.mem.prev[ l.mem.next[ x ]] = l.mem.prev[ x ]
    end
    freeObject( l.mem, x )
end

"""
    list_search( l, key )
pesquisa do elemento da lista l com a chave key
"""
function listSearch( l, key )
    x = l.head
    while x != NIL && l.mem.key[ x ] != key
        x = l.mem.next[ x ]
    end
    x
end

#end


memory = MemoryDoubleLinkedList(10)
doubleLinked = DoubleLinkedList(memory)

listInsert(doubleLinked, 2)
listInsert(doubleLinked, 5)
listInsert(doubleLinked, 1)

println(listSearch(doubleLinked, 2))  # Deve retornar o índice onde o valor 2 está armazenado
println(listSearch(doubleLinked, 5))  # Deve retornar o índice onde o valor 5 está armazenado
println(listSearch(doubleLinked, 10)) # Deve retornar NIL, já que 10 não está na lista
println(listSearch(doubleLinked, 1)) # Deve retornar NIL, já que 10 não está na lista
println()

listDelete(doubleLinked, 1)
println(listSearch(doubleLinked, 1)) # Deve retornar NIL, já que 10 não está na lista
