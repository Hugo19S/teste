"   tabela de dispersão ;
    mapas associativos ;
    dicionários, etc"

"6. Hash-Tables

6.1 Tabelas de Endereçamento Direto"

mutable struct DirectAddress
    T::Array{Any}
    DirectAddress(m::Int64) = new(fill(nothing, m))
end

mutable struct Disciplinas
    key::Int64
    Nome::String
    Semestre::Int64
    Nota::Int64
    Etcs::Float64
end

"a) programe as funções de criação, inserção , acesso e pesquisa."

function direct_address_search(T::DirectAddress, k)
    return T.T[k]
end

function direct_address_insert(T::DirectAddress, x::Disciplinas)
    T.T[x.key] = x #T[x.key] = x
end

function direct_address_delete(T::DirectAddress, x::Disciplinas)
    return T.T[x.key] = nothing #T[x.key] = T.NILL
end

"
b) experimente estas tabelas com as classificações das disciplinas que já realizou"

m = 100
directAddress = DirectAddress(m)

# Dados das disciplinas
dados_disciplinas = [
    ("Algebra Linear", 2, 15, 6),
    ("Análise Matemática", 1, 10, 6),
    ("Arquitactura de Computadores", 2, 17, 6),
    ("Base de Dados |", 2, 14, 6),
    ("Fisica Aplicada á Computação", 1, 12, 6),
    ("Matemática Discreta", 1, 11, 6),
    ("Introdução á Programação", 1, 13, 6),
    ("Probabilidades e Estatistica", 2, 17, 6),
    ("Programação orientada por Objectos", 2, 18, 6),
    ("Sistemas Digitais", 1, 10, 6),
    ("Base de Dados ||", 1, 14, 6),
    ("Engenharia de Software", 2, 11, 6),
    ("Estratura de Dados e Algoritmos", 2, 0, 6),
    ("Interação Pessoa-Computador", 2, 17, 6),
    ("Linguagens de Programação", 1, 10, 6),
    ("Matemática Computacional", 1, 12, 6),
    ("Redes de Computadores |", 1, 13, 6),
    ("Redes de Computadores ||", 2, 16, 6),
    ("Sistemas Operativos", 1, 11, 6),
    ("Tecnologias para Web e Ambientes Móveis", 2, 0, 6),
    ("Adminstração de Sistema", 2, 0, 4.5),
    ("Desenvolvimento de Aplicações Web", 1, 18, 6),
    ("Dinâmica de Grupos e Comunicação", 1, 15, 2),
    ("Estágio ou Projeto Final", 2, 0, 15),
    ("Markting e Empreendedorismo", 2, 0, 3),
    ("Programação para Dispositivos Móveis", 1, 18, 6),
    ("Projeto Integrado", 1, 15, 4)
]

for (key, (nome, semestre, nota, etcs)) in enumerate(dados_disciplinas)
    direct_address_insert( directAddress, Disciplinas(key, nome, semestre, nota, etcs))
end

data = direct_address_search(directAddress, 4)

println("Key: $(data.key)\nNome: $(data.Nome)\nSemestre: $(data.Semestre)\nNota: $(data.Nota)\nEstcs: $(data.Etcs)")

direct_address_delete(directAddress, data)

data = direct_address_search(directAddress, 4)
println(data)
println(directAddress)

"6.2 hash-tables

a) crie as funções necessárias para trabalhar com hash-tables"
# 2 * 15 = 30 => 31
#tamanho::Int = 31

mutable struct Data
    key::Int
    name::String
    age::Int
    
end

mutable struct Hash
    T::Vector{Union{Data, Nothing}}
    Tamanho::Int

    function Hash(tamanho::Int)
        new(Vector{Union{Data, Nothing}}(nothing, tamanho), tamanho)
    end
end

function functionHashDivision(k, tamanho)
    return k % tamanho
end

function functionHashMultiplication(k, m) # m é o tamanho da tabela
    return ((k * 0.6180339887) % 1) * m
end

function chained_hash_insert(T::Hash, x::Data)
    id = functionHashDivision(x.key, 31)

    while T.T[id] !== nothing
        id = functionHashDivision(id+1, 31)
    end

    T.T[id] = x
end

function chained_hash_search(T::Hash, k)
    id = functionHashDivision(k, 31)

    while T.T[id] !== nothing
        if T.T[id].key == k
            return T.T[id]
        else
            id = functionHashDivision(k+1, 31)
        end
    end
    return 0
end

function chained_hash_delete(T::Hash, x)
    
end

x = Data(45, "Sara", 45)
x1 = Data(90, "Mara", 90)
x2 = Data(120, "Carla", 30)
x3 = Data(400, "Maria", 29)
x4 = Data(100, "Bela", 20)
x5 = Data(150, "Marcos", 50)
hash = Hash(15)

chained_hash_insert(hash, x)
chained_hash_insert(hash, x1)
chained_hash_insert(hash, x2)
chained_hash_insert(hash, x3)
chained_hash_insert(hash, x4)
chained_hash_insert(hash, x5)

println("\n")
println(hash.T)

println(chained_hash_search(hash, 45))
println(chained_hash_search(hash, 400))

"b) crie as funções necessárias para a resolução de colisões

c) experimente as funções de hash pelo método da divisão e pelo método da multiplicação"

"
6.3 Endereçamento aberto

a) crie novas versões das funções de modo a usar endereçamento aberto

b) adapte para o uso de uma struct com dois campos. O primeiro um número inteiro e o segundo um valor real.

c) realize várias versões: a primeira para teste linear; a segunda para teste quadrático e a terceira com dupla função de hash"