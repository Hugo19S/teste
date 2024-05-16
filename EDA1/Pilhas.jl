module Pilha

    export stackEmpty, stackFull, push, pop, Stack

    mutable struct Stack
        top::Int
        mem::Array{Any}
    end

    function stackFull(S::Stack) #verificar se a pilha está cheia
        if S.top == length(S.mem)
            return true
        end
        return false
    end

    function stackEmpty(S::Stack) #verificar se a pilha está vazia
        if S.top == 0
            return true
        end
        return false
    end

    function push(S::Stack, x) #empurrar para a pilha
        if stackFull(S)
            error("A pilha esta cheia!")
        else
            S.top = S.top + 1
            S.mem[S.top] = x
        end

    end

    function pop(S::Stack) #remoção da pilha
        if stackEmpty(S::Stack)
            error("A pilha esta vazia!")
        else
            S.top = S.top - 1
            return S.mem[S.top+1]
        end
    end
end