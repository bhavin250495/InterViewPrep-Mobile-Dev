
class Node<T> {
    var value:T
    var next:Node?
    init(value:T){
        self.value = value
    }
}
class StackLL<T> {
    var top:Node<T>?
    var bottom:Node<T>?
    var length = 0
    
    init(){
    
    }
    
    func peek() -> Node<T>? {
        return top
    }
    
    func push(value:T) {
        let node = Node(value: value)
        if length == 0 {
            top = node
            bottom = top
        }else {
            let temp = top
            top = node
            top?.next = temp
        }
        length+=1
    }
    
    func pop(){
        top = top?.next
        length-=1
    }
}

class StackArr<T>{
    private var arr = [T]()
    var top: T?
    func push(value:T){
        arr.append(value)
        top = arr.last
    }
    func peek() -> T? {
        return arr.last
    }
    
    func pop() {
        if arr.count>0 {
            arr.removeLast()
            top = arr.last
        }
        
    }
    
}

func balancedParanthesis(arr:String) -> Bool {
    var strArr = arr.map { String($0)}
    let opening = ["{","(","["]
    let stack = StackArr<String>()
    
    for char in strArr {
        if stack.top == nil {
            return false
        }
        if opening.contains(char) {
            stack.push(value: char)
        }else {
            switch char {
            case "}": stack.pop()
            case ")": stack.pop()
            case "]": stack.pop()
            default:
                break
            }
        }
    }
    if stack.top == nil {
        return true
    }
    return false
}


class QueueUsingStack {
    var proxyStack:StackArr<Int> = StackArr()
    var mainStack:StackArr<Int> = StackArr()
    var length = 0
    func first() -> Int{
        return proxyStack.top ?? 0
    }
  
    func enqueue(value:Int) {
        // Use 2 stacks
        // put all stack1 into stack2 push into stack1 then put all stack2 to stack1
        if length == 0 {
            proxyStack.push(value: value)
        }else {
            while(proxyStack.top != nil) {
                mainStack.push(value: proxyStack.top ?? 0)
                proxyStack.pop()
            }
            proxyStack.push(value: value)
            while(mainStack.top != nil) {
                proxyStack.push(value: mainStack.top ?? 0)
                mainStack.pop()
            }
        }
        
        length+=1
    }
    func dequeue() {
        proxyStack.pop()
    }
}



