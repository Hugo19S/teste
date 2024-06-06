"5.5 Árvores Binárias

a) programe o sistema de gestão de memória para árvores binárias."

mutable struct TreeNode
    p
    left
    rigth
    key
    TreeNode(NILL) = new(NILL, NILL, NILL, NILL)
end

mutable struct BinaryTree
    root::TreeNode
    NILL
end

function BinaryTree()
    node = TreeNode(nothing)
    BinaryTree(node, nothing)
end

function emptyBinaryTree(tree::BinaryTree)
    if tree.root.key === nothing
        return true
    end

    return false
end

function insertLeft(node::TreeNode, x)
    if node.left === nothing
        newNode = TreeNode(nothing)
        newNode.key = x
        newNode.left = nothing
        newNode.rigth = nothing
        node.left = newNode
        node.left.p = node
    else
        if x < node.left.key
            insertLeft(node.left, x)
        else
            insertRigth(node.left, x)
        end
    end
end

function insertRigth(node::TreeNode, x)
    if node.rigth === nothing
        newNode = TreeNode(nothing)
        newNode.key = x
        newNode.left = nothing
        newNode.rigth = nothing
        node.rigth = newNode
        node.rigth.p = node
    else
        if x < node.rigth.key
            insertLeft(node.rigth, x)
        else
            insertRigth(node.rigth, x)
        end
    end
end

function insertBinary(tree::BinaryTree, x)
    if emptyBinaryTree(tree)
        tree.root.key = x
        tree.root.left = tree.NILL
        tree.root.rigth = tree.NILL
        tree.root.p = tree.NILL

    else
        if x < tree.root.key
            insertLeft(tree.root, x)
        else
            insertRigth(tree.root, x)
        end
    end
end
##################################################################################################
function iterativeTreeSearch(node::TreeNode, x) # atention
    while node !== nothing && x != node.key
        if x < node.key
            node = node.left
        else 
            node = node.rigth
        end
    end
    return node
end

function searchLeftAndRigth(node::TreeNode, x)
    if node.key == x
        return "Valor $(node.key) encontrado!"
    else
        if x < node.key && node.left !== nothing
            searchLeftAndRigth(node.left, x)

        elseif x > node.key && node.left !== nothing
            searchLeftAndRigth(node.rigth, x)

        else
            return "O valor $x não se encontra na árvore binária."
        end
    end
end

function searchBinary(tree::BinaryTree, x)

    if emptyBinaryTree(tree)
        error("A árvore binária está vazia!")
    else
        if tree.root.key == x
            return "Valor $(tree.root.key) encontrado!"
        else
            if x < tree.root.key && tree.root.left !== nothing
                #return searchLeftAndRigth(tree.root.left, x)
                #return iterativeTreeSearch(tree.root.left, x)

            elseif x > tree.root.key && tree.root.rigth !== nothing
                #return searchLeftAndRigth(tree.root.rigth, x)
                #return iterativeTreeSearch(tree.root.rigth, x)
            else
                return "O valor $x não se encontra na árvore binária."
            end
        end
    end
end

#################################3
function treeMinimum(tree::BinaryTree)
    node = tree.root
    while node.left !== nothing
        node = node.left
    end

    return node
end

function treeMaximum(tree::BinaryTree)
    node = tree.root
    while node.rigth !== nothing
        node = node.rigth
    end

    return node
end

function tree_Sucessor(x::TreeNode)
    if x.rigth !== nothing
        return treeMinimum(x.rigth)
    end

    y = x.p

    while y !== nothing && x == y.rigth
        x = y
        y = y.p
    end
    return y
end



"b) teste o funcionamento das árvores binárias."

bt = BinaryTree()
insertBinary(bt, 200)
insertBinary(bt, 400)
insertBinary(bt, 100)
insertBinary(bt, 201)
insertBinary(bt, 500)

println("Maximum $(treeMaximum(bt))")
println("Minimum $(treeMinimum(bt))")

println(searchBinary(bt, 200))
println(searchBinary(bt, 205))
