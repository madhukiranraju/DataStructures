import UIKit

class Stack<T>{
    private var storage : [T] = []
    
    init() {
    }
    
    func push(_ element:T){
        storage.append(element)
    }
    
    func pop()->T?{
        return storage.popLast()
    }
}


extension Stack:CustomStringConvertible{
    
    var description: String {
        let topDivider = "----Top-----\n"
        let bottomDivider = "\n--------"

        let stackElement = storage.map{"\($0)"}.reversed().joined(separator: "\n")
        return topDivider+stackElement+bottomDivider
    }
}


var stack = Stack<Int>()

stack.push(10)
stack.push(20)
stack.push(30)

print(stack)

stack.pop()
print("=============")
print(stack)
