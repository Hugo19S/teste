module DoubleLinked
    export ListNode, DoubleLinked, listInsert, listDelete, listSearch

    # Definindo a estrutura para os nós da lista
    mutable struct ListNode{T}
        key::T
        prev::Union{ListNode{T},Nothing} # Apontador para o nó predecessor
        next::Union{ListNode{T},Nothing} # Apontador para o nó sucessor
    end

    # Definindo a estrutura para a lista duplamente ligada
    mutable struct DoublyLinkedList{T}
        head::Union{ListNode{T},Nothing} # Nó cabeça da lista
        tail::Union{ListNode{T},Nothing} # Nó cauda da lista
    end

    function listSearch(L::DoublyLinkedList, k::Any)
        x = L.head
        while x !== nothing && x.key != k
            x = x.next
        end
        return x
    end

    function listInsert(L::DoublyLinkedList, x::ListNode)
        x.next = L.head

        if L.head !== nothing
            L.head.prev = x
        else
            L.tail = x
        end

        L.head, x.prev = x, nothing

    end

    function listDelete(L::DoublyLinkedList, x::ListNode)
        if x.prev !== nothing
            x.prev.next = x.next
        else
            L.head = x.next
        end

        if x.next !== nothing
            x.next.prev = x.prev
        else
            L.tail = x.prev
        end
    end

end
