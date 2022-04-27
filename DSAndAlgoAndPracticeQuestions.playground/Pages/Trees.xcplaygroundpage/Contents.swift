//: [Previous](@previous)
import Foundation
class Queue<T> {
    var dataArr = [T]()
    func enqueue(data:T) {
        dataArr.append(data)
    }
    func dequeue() -> T? {
        if dataArr.count > 0 {
            let temp = dataArr.first
            dataArr =  Array(dataArr.dropFirst())
            return temp
        }
        return nil
    }
}
class Node {
    var left:Node?
    var right:Node?
    var value:Int
    init(value:Int) {
        self.value = value
    }
}

class BST {
    
    var root:Node?
    
    func insert(value:Int){
        if root == nil {
            root = Node.init(value: value)
        }else {
            var currentNode = root
            while(true){
                if value < currentNode!.value {
                    if currentNode?.left == nil {
                        currentNode?.left = Node(value: value)
                        break
                    }
                    currentNode = currentNode?.left
                }else {
                    if currentNode?.right == nil {
                        currentNode?.right = Node(value: value)
                        break
                    }
                    currentNode = currentNode?.right
                }
            }
        }
    }
func lookup(value:Int) -> Bool {
    if root == nil {
        return false
    }else {
        var current = root
        while(current != nil){
            if value < current!.value {
                current = current?.left
            }
            else if value > current!.value {
                current = current?.right
            }else if current?.value == value {
                return true
            }
        }
    
    }
    return false
}
    //Question  validate bst
    func bfs() {
        let queue = Queue<Node>()
        var list = [Int]()
        var current = root
        queue.enqueue(data: current!)
        print(queue.dataArr[0].value)
        while(queue.dataArr.count > 0) {
            current = queue.dequeue()
            
            list.append(current?.value ?? 0)
            if current?.left != nil {
                queue.enqueue(data: current!.left!)
            }
            if current?.right != nil {
                queue.enqueue(data: current!.right!)
            }
            
        }
        print(list)
        
    }
    //DFS
    func inorder(node:Node,list: [Int]) -> [Int]{
        var inList = list
        if (node.left != nil) {
           inList =  inorder(node: node.left!, list: inList)
        }
        inList.append(node.value)
        if (node.right != nil) {
            inList = inorder(node: node.right!, list: inList)
        }
        
        return inList
    }
    func preorder(node:Node,list: [Int]) -> [Int]{
        var inList = list
        inList.append(node.value)
        if (node.left != nil) {
           inList =  preorder(node: node.left!, list: inList)
        }
        
        if (node.right != nil) {
            inList = preorder(node: node.right!, list: inList)
        }
        
        return inList
    }
    func postorder(node:Node,list: [Int]) -> [Int]{
        var inList = list
        
        if (node.left != nil) {
           inList =  postorder(node: node.left!, list: inList)
        }
        
        if (node.right != nil) {
            inList = postorder(node: node.right!, list: inList)
        }
        inList.append(node.value)
        
        return inList
    }
}

var bst = BST()
bst.insert(value: 9)
bst.insert(value: 4)

bst.insert(value: 6)
bst.insert(value: 20)

bst.insert(value: 170)
bst.insert(value: 15)
bst.insert(value: 1)
print(bst.postorder(node: bst.root!, list: []))
//Learn about heaps min max
//window shift
//Hash maps, Hash table
//Palindrome
