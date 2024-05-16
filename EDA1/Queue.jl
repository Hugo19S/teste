module FilaEspera

    export Queue, enQueue, deQueue

    mutable struct Queue
        head::Int64
        tail::Int64
        mem::Array{Any}
        volta::Bool
    end

    function queueFull(Q::Queue) #verificar se a fila está cheia
        if Q.tail == Q.tail + 1 || Q.volta
            return true
        end
        return false
    end

    function queueEmpty(Q::Queue) #verificar se a fila está vazia
        if Q.head == Q.tail && Q.volta
            return false
        elseif Q.head == Q.tail
            return true
        end
        return false
        
    end

    function enQueue(Q::Queue, x::Any) #adicioa  um elemento na fila
        if queueFull(Q)
            print( "Fila Cheia")
            return
        else
            Q.mem[Q.tail] = x

            if Q.tail == length(Q.mem) #remove  o limite da fila
                Q.tail = 1
                if Q.head == 1
                    Q.volta = !Q.volta
                end
                
            else
                Q.tail += 1
            end
            println(Q)
        end
    end

    function deQueue(Q::Queue)
        if queueEmpty(Q)
            error("Fila Vazia")
        else
            x = Q.mem[Q.head]

            if Q.head == length(Q.mem)
                Q.head = 1
                Q.volta = !Q.volta
            else
                Q.head += 1
            end
            return x
        end
        
    end
end