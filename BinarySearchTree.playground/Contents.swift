import UIKit


class BinaryNode<T>{
    
    var value : T
    
    var leftChild : BinaryNode?
    var rightChild : BinaryNode?
    
    init(value:T) {
        self.value = value
    }
    
    var min: BinaryNode {
        return leftChild?.min ?? self
    }
}
extension BinaryNode: CustomStringConvertible {
    
    public var description: String {
        return diagram(for: self)
    }
    
    private func diagram(for node: BinaryNode?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ")
            + root + "\(node.value)\n"
            + diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}


class BinarySearchTree<T: Comparable>{
    
    private var root :BinaryNode<T>?
    
    init() { }
}

extension BinarySearchTree: CustomStringConvertible {
    
    var description: String {
        
        guard let root = root else { return "Empty tree" }
        return String(describing: root)
        
    }
    
}

extension BinarySearchTree {
    
    func insert(_ value: T) {
        root = insert(from: root, value: value)
    }
    
    private func insert(from node: BinaryNode<T>?, value: T) -> BinaryNode<T> {
        
        guard let node = node else {
            return BinaryNode(value: value)
        }
        
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        
        return node
        
    }
    
    func contains(_ value : T) -> Bool{
        var current = root
        while let node = current {
            if node.value == value{
                return true
            }
            
            if value < node.value{
                current = node.leftChild
            }else{
                current = node.rightChild
            }
        }
        return false
    }
    
    func remove(_ value: T) {
        root = remove(node: root, value: value)
    }
    
    private func remove(node: BinaryNode<T>?, value: T) -> BinaryNode<T>? {
        
        guard let node = node else {
            return nil
        }
        
        if value == node.value {
            
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            
            if node.leftChild == nil {
                return node.rightChild
            }
            
            if node.rightChild == nil {
                return node.leftChild
            }
            
            node.value = node.rightChild!.min.value
            node.rightChild = remove(node: node.rightChild, value: node.value)
            
            
        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        
        return node
    }
}

var bst = BinarySearchTree<Int>()
bst.insert(50)
bst.insert(25)
bst.insert(12)
bst.insert(10)
bst.insert(17)
bst.insert(37)
bst.insert(32)
bst.insert(27)
bst.insert(45)
bst.insert(33)
bst.insert(75)
bst.insert(63)
bst.insert(87)

print(bst)

bst.contains(5)

bst.remove(25)

print(bst)
