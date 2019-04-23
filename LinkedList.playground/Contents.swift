import UIKit


class Node<T>{
    var value : T
    var next : Node?
    
    init(value :T, next :Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node:CustomDebugStringConvertible{
    
    var debugDescription: String{
        guard let next = next else {
            return "\(value)"
        }
        
        return "\(value) ---> " + String(describing: next) + " "
    }
}


class LinkedList<T>{

    var head : Node<T>?
    var tail : Node<T>?

    var len : Int = 0

    var isEmpty : Bool{
        return head == nil
    }

    init() {    }

    func append(value : T){
        if head == nil{
            head = Node(value: value)
            return
        }
        
        var current = head
        while let _ = current?.next {
            current = current?.next
        }
        current?.next = Node(value: value)
        len += 1
    }
    
    
    
    func remove(at : Int){
        
        if head == nil{
            return
        }
        
        if at == 0{
            head = head?.next
        }
        
        var current = head
        var previous: Node<T>?
        var index = 0
        
        for _ in 0..<at{
            previous = current
            current = current?.next
            index += 1
        }
        
        if previous != nil {
            previous?.next = current?.next
        } else {
            head = current?.next
        }
    }
    
    
    func insert(at : Int, value:T){

        var node = Node(value: value)
        if head == nil{
            head = node
            return
        }
        var current = head
        var previous: Node<T>?
        var index = 0
        for _ in 0...at{
            
            if index == at{
                previous?.next = node
                node.next = current
            }
            previous = current
            current = current?.next
            index += 1
        }
    }
}

extension LinkedList :CustomStringConvertible {
    var description :String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}


var list = LinkedList<Int>()
list.append(value: 10)
list.append(value: 20)
list.append(value: 40)
list.append(value: 100)

print(list)

list.remove(at: 2)
list.insert(at: 2, value: 99)
print(list)







