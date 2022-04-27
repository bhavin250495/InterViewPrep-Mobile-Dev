import Foundation

class Node {
    var data:Any
    var next:Node?
    var prev:Node?
    init(data:Any) {
        self.data = data
    }
}

class LinkedList {
    var head:Node?
    var tail:Node?
    var lenght = 0
    init(data:Any){
        self.head =  Node(data:data)
        self.tail = self.head
        lenght = 1
    }

    func append(data:Any){
        let tempNode = Node(data: data)
        tempNode.prev = tail
        tail?.next = tempNode
        tail = tempNode
        lenght+=1
    }

    func prepend(data:Any) {
        let tempNode = Node(data: data)
        tempNode.next = head
        head = tempNode
        lenght+=1
    }
    func insert(index:Int,data:Any){
        if index == 0 {
            prepend(data: data)
            return
        }
        else if lenght>index {
            let currentNode = traverse(index: index)
            let newNode = Node(data: data)
            
            
            let previous = currentNode?.prev
            previous?.next = newNode
            newNode.next = currentNode
            currentNode?.prev = newNode
            newNode.prev = previous
            
            
            lenght+=1
        }else {
            append(data: data)
        }
    }
    
    func traverse(index:Int) -> Node? {
        var currentNode = head
        for i in 0...lenght {
           
            
            if i == index {
                print(currentNode?.data)
                return currentNode
            }else {
                currentNode = currentNode?.next
            }
        }
        return nil
    }
    
    func remove(index:Int) {
        if lenght>index {
            let deleteNode = traverse(index: index)
            let prev = deleteNode?.prev
            let next = deleteNode?.next
            prev?.next = next
            next?.prev = prev
        }else {
            
        }
    }
    
    
    func reverse() {
       var first = head
       var second = first?.next
        
        while(second != nil){
            var temp = second?.next
            second?.next = first
            first = second
            second = temp
        }
        head?.next = nil
        head = first
        
    }
    
    func printLL() {
        var arr = [Any]()
        var current = head
        while ((current) != nil){
            //print(current?.data as Any)
            arr.append(current?.data)
            current = current?.next
            
        }
        
        print(arr)
    }
}


var linkedList = LinkedList(data:10)
linkedList.append(data: 12)
linkedList.append(data: 14)
linkedList.append(data: 15)
//
linkedList.append(data: 19)
//linkedList.prepend(data: 1)
linkedList.printLL()
linkedList.lenght
linkedList.insert(index: 1, data: 700)
linkedList.printLL()
linkedList.reverse()
linkedList.printLL()


