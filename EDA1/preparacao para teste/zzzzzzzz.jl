using Distributions

struct Pessoa
    idade::Int
    nome::String
    salario::Float64
end

names = [
    "Alice Smith", "Bob Johnson", "Carol Williams", "Dave Brown", "Eve Jones",
    "Frank Miller", "Grace Davis", "Hank Wilson", "Ivy Moore", "Jack Taylor",
    "Kara Anderson", "Leo Thomas", "Mia Jackson", "Nina White", "Oscar Harris",
    "Paul Martin", "Quinn Thompson", "Rose Martinez", "Sam Robinson", "Tina Clark"
]

function Pessoa(n)
    return [Pessoa(rand(18:66), "carlos $i", rand(1000:3000)) for i in 1:n]
end

function insertion_sort!(A::Array{Pessoa})
    for j = 2:length(A)
        key = A[j]
        i = j - 1
        while i > 0 && A[i].idade > key.idade
            A[i+1] = A[i]
            i = i - 1
        end
        A[i+1] = key
    end
end

function tempo_exec(n)
    m = 25
    total_tempo = zeros(Float16, n)

    for i in 1:m
        pessoas = Pessoa(n)
        total_tempo[i] = @elapsed insertion_sort!(pessoas)
    end
    
    return mean(total_tempo)
end

function escolha(numero)
    return (Int(round(numero / 9)), Int(round(numero / 2)))
end

function main()
    println(escolha(19425))

    println(tempo_exec(50000))
    
end

main()