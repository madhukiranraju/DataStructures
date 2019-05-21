import UIKit

class BinaryNode<T>{
    var value : T
    
    var leftNode : BinaryNode<T>?
    var rightNode : BinaryNode<T>?
    
    init(_ value : T) {
        self.value = value
    }
}

extension BinaryNode{
    
    func traversePreOrder(visit : (T)->Void)  {
        visit(value)
        leftNode?.traversePreOrder(visit: visit)
        rightNode?.traversePreOrder(visit: visit)
    }
    
    func traversePostOrder(visit : (T) -> Void) {
        leftNode?.traversePostOrder(visit: visit)
        rightNode?.traversePostOrder(visit: visit)
        visit(value)
    }
    
    func traverseInOder(visit : (T) -> Void)  {
        leftNode?.traverseInOder(visit: visit)
        visit(value)
        rightNode?.traverseInOder(visit: visit)
    }
}

/*
         10
       /    \
      9      2
    /  \    / \
   1    3  4   6
 
*/

let ten = BinaryNode(10)
let nine = BinaryNode(9)
let two = BinaryNode(2)
let one = BinaryNode(1)
let three = BinaryNode(3)
let four = BinaryNode(4)
let six = BinaryNode(6)


//ten.leftNode = nine
//ten.rightNode = two
//
//nine.leftNode = one
//nine.rightNode = three
//
//two.leftNode = four
//two.rightNode = six


ten.traverseInOder{
    print($0)
}

print("---------")
print("POST ORDER")
print("---------")

ten.traversePostOrder {
    print($0)
}

print("---------")
print("PRE ORDER")
print("---------")

ten.traversePreOrder {
    print($0)
}




func basicRecusion(max:Int, current:Int){
    if current == max {
        return
    }
    
    return basicRecusion(max: max, current: current+1)
}


basicRecusion(max: 10, current: 5)


