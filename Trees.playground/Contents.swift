import UIKit

/*
 Tree contains
 1. Root (Contains the child node)
 2. Leaf (doesnot contain any child)
 
 
                 Root
                /   \
               /     \
            leaf1   leaf2
 */


class Queue<T>{
    
    private var storage : [T] = []
    
    var isEmpty : Bool{
        return storage.isEmpty
    }
    
    func enqueue(_ element:T){
        storage.append(element)
    }
    
    func dequeue()->T?{
        return isEmpty ? nil : storage.removeFirst()
    }
}

class TreeNode<T>{
    
    var value : T
    var children : [TreeNode] = []
    
    init(_ value : T) {
        self.value = value
    }
    
    func addChild(_ childNode : TreeNode){
        self.children.append(childNode)
    }
    
}

extension TreeNode where T:Equatable{
    func depthFirst(_ node : (TreeNode) -> Void){
        node(self)
        children.forEach {
                $0.depthFirst(node)
        }
    }
    
    
    
//    func levelOrderFirst(_ node : (TreeNode) -> Void){
//        node(self)
//        var queue = Queue<TreeNode>()
//        children.forEach {
//            queue.enqueue($0)
//        }
//
//        while let qnode = queue.dequeue() {
//            node(qnode)
//            qnode.children.forEach {    queue.enqueue($0)     }
//        }
//    }
    
    func levelOrderFirst(_ visit: (TreeNode) -> Void) {
        
        visit(self)
        var queue = Queue<TreeNode>()
        children.forEach {
            queue.enqueue($0)
        }
        while let node = queue.dequeue() {
            visit(node)
            if node != nil {
                node.children.forEach {  queue.enqueue($0) }
            }
        }
        
    }
    
    func search(_ value : T)->TreeNode?{
        var result : TreeNode?
        
        depthFirst { node in
            if node.value == value{
                result = node
            }else{
                node
            }
        }
        return result
    }
    
}

let drinksNode = TreeNode<String>("Drinks")

let hotNode = TreeNode<String>("Hot")
let coldNode = TreeNode<String>("Cold")

drinksNode.addChild(hotNode)
drinksNode.addChild(coldNode)
/*
        Drinks
        /    \
       /      \
     hot      cold
 */

hotNode.addChild(TreeNode<String>("Tea"))
hotNode.addChild(TreeNode<String>("Coffee"))

coldNode.addChild(TreeNode<String>("Milk"))
coldNode.addChild(TreeNode<String>("Cola"))

drinksNode.depthFirst {
    print($0.value)
}

drinksNode.levelOrderFirst{
    print($0.value)
}

if let searchResult =  drinksNode.search("Coka"){
    print(searchResult.value)
}
