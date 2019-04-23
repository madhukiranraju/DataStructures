import UIKit

class Queue<T>{
    private var storage : [T] = []
    
    init() {
    }
    
    func peek()->T{
        return storage[0]
    }
    
    func enqueue(_ element:T){
        storage.append(element)
    }
    
    func dequeue()->T?{
        return storage.removeFirst()
    }
}


extension Queue:CustomStringConvertible{
    
    var description: String {
        let topDivider = "----Top-----\n"
        let bottomDivider = "\n--------"

        let queueElement = storage.map{"\($0)"}.reversed().joined(separator: "\n")
        return topDivider+queueElement+bottomDivider
    }
}


var queue = Queue<Int>()

queue.enqueue(10)
queue.enqueue(20)
queue.enqueue(30)

print(queue.peek())

print(queue)
print("=========")

queue.dequeue()

print(queue)
