mutable struct TreeNode
    p
    left::Union{TreeNode, Nothing} # child
    rigth::Union{TreeNode, Nothing} # sibling
    key
    TreeNode(NILL) = new(NILL, NILL, NILL, NILL)
end

mutable struct N_Aria_Tree
    root::TreeNode
    NILL
end

function N_Aria_Tree()
    node = TreeNode(nothing)
    N_Aria_Tree(node, nothing)
end

function emptyBinaryTree(tree::N_Aria_Tree)
    if tree.root.key === tree.NILL
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
        node.rigth.p = node.p
    else
        if x < node.rigth.key
            insertLeft(node.rigth, x)
        else
            insertRigth(node.rigth, x)
        end
    end
end

function insertBinary(tree::N_Aria_Tree, x)
    if emptyBinaryTree(tree)
        tree.root.key = x
        tree.root.left = tree.NILL
        tree.root.rigth = tree.NILL
        tree.root.p = tree.NILL

    else
        insertLeft(tree.root, x)
    end
end
##############################################################
function searchLeftAndRigth(node::TreeNode, x)
    if node.key == x
        return "Valor $(node.key) encontrado!"
    else
        if x < node.key && node.left !== nothing
            searchLeftAndRigth(node.left, x)

        elseif x > node.key && node.rigth !== nothing
            searchLeftAndRigth(node.rigth, x)

        else
            return "O valor $x não se encontra na árvore binária."
        end
    end
end

function searchN_Aria_Tree(tree::N_Aria_Tree, x)

    if emptyBinaryTree(tree)
        error("A árvore binária está vazia!")
    else
        if tree.root.key == x
            return "Valor $(tree.root.key) encontrado!"
        else
            if tree.root.left !== nothing
                return searchLeftAndRigth(tree.root.left, x)
            else
                return "O valor $x não se encontra na árvore binária."
            end
        end
    end
end

bt = N_Aria_Tree()
insertBinary(bt, 350)
insertBinary(bt, 500)
insertBinary(bt, 600)
insertBinary(bt, 700)
insertBinary(bt, 400)
insertBinary(bt, 450)
insertBinary(bt, 470)

println("Nó raiz: $(bt.root.key)")
println("Nó a direita da raíz: $(bt.root.rigth)")
println("Nó a esqueda da raíz: $(bt.root.left.key) e a sua raíz $(bt.root.left.p.key)")
println("Nó: $(bt.root.left.rigth.key) e a sua raiz $(bt.root.left.rigth.p.key)")
println("Nó: $(bt.root.left.rigth.rigth.key) e a sua raiz $(bt.root.left.rigth.rigth.p.key)")
println("Nó: $(bt.root.left.left.key) e a sua raiz $(bt.root.left.left.p.key)")
println("Nó: $(bt.root.left.left.rigth.key) e a sua raiz $(bt.root.left.left.rigth.p.key)")
println("Nó: $(bt.root.left.left.rigth.rigth.key) e a sua raiz $(bt.root.left.left.rigth.rigth.p.key)")

println(searchN_Aria_Tree(bt, 100))
println(searchN_Aria_Tree(bt, 350))
println(searchN_Aria_Tree(bt, 500))
println(searchN_Aria_Tree(bt, 600))
println(searchN_Aria_Tree(bt, 700))
println(searchN_Aria_Tree(bt, 400))
println(searchN_Aria_Tree(bt, 450))
println(searchN_Aria_Tree(bt, 470))