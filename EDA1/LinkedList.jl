# Definindo a estrutura para os nós da lista
struct ListNode{T}
    key::T
    prev::Union{ListNode{T}, NIL} # Apontador para o nó predecessor
    next::Union{ListNode{T}, NIL} # Apontador para o nó sucessor
end

# Definindo a estrutura para a lista duplamente ligada
mutable struct DoublyLinkedList{T}
    head::Union{ListNode{T}, NIL} # Nó cabeça da lista
    tail::Union{ListNode{T}, NIL} # Nó cauda da lista
end

function emptyLinked()
    
end

function fullLinked()
    
end

function listSearch(L::Linked, k)
    x = L.head
    while x != NIL && x.key !=k
        x = x.next
    end
end

function listSearch(L, key)
    p = L.head
    while L.a_next[p] != 0 && L.a_key[p] != key
        p = L.a_next[p]
    end
    return p
end

function listInsert(L, x)
    
end

function listDelete(L, x)
    
end