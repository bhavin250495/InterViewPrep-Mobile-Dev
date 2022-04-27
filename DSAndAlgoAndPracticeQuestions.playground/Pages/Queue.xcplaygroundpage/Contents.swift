import Foundation
class Node<T> {
    var value:T?
    var next:Node<T>?
    init(value:T){
        self.value  = value
    }
}
class QueueLL<T> {
    var first:Node<T>?
    var last:Node<T>?
    var length = 0
    
    func peek() -> Node<T>? {
        return first
    }
    
    func enqueue(value:T) {
        let node = Node(value:value)
        if length == 0 {
            first = node
            last = node
        }else{
            last?.next = node
            last = node
        }
        length+=1
    }
    func dequeue() {
        if length == 1 {
            first = nil
            last = nil
        }else {
            first = first?.next
        }
        length-=1
    }
}

class Queue {
    var dataArr = [Int]()
    func enqueue(data:Int) {
        dataArr.append(data)
    }
    func dequeue() -> Int? {
        if dataArr.count > 0 {
            dataArr =  Array(dataArr.dropFirst())
            return dataArr.first
        }
        return nil
    }
}

let queue = Queue()
queue.enqueue(data: 1)
queue.enqueue(data: 2)
queue.enqueue(data: 3)
print(queue.dataArr)
queue.dequeue()
print(queue.dataArr)

