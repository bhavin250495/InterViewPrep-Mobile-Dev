//: [Previous](@previous)

import Foundation

class A {
    var a = 1
    var  b = 2
    init() {
        a = 3
    }
}
class B: A{
   // override var a = 5
   
    convenience init() {
        self.init()
        print(a)
    }
}

B()

//: [Next](@next)
