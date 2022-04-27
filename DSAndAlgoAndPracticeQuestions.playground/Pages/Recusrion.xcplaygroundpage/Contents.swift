//: [Previous](@previous)

import Foundation


func sumAdd(_ sum:Int,_ max:Int, _ index:Int) -> Int {
    if index > max {
        return sum
    }
    
    var s = sum + index
    print(s)
    var i =  index + 1
   // print(s)
    var sum =   sumAdd(s,max,i)
    
    return sum
}

sumAdd(0,5,0)

//: [Next](@next)
