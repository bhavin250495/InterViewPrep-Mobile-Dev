//: [Previous](@previous)

import Foundation

//Recursive
func factorial(num:Int) -> Int {
    if num == 0 || num == 1{
        return num
    }
    var result = num * factorial(num:num-1)
    return result
}

func factorialIt(num:Int) -> Int {
    var result = num
    
    for i in 1..<num{
       // print(num-i)
        var idx = num-i
        result = result * idx
        //print(result)
    }
    return result
}

//Series... 0 1 1 2 3 5 8 13 21..
func fibonacci(num:Int) -> Int{
    if num<2 { return num }
    return fibonacci(num:num-1) + fibonacci(num:num-2)
}

func reverseString(str:String) {
    if str.isEmpty {return}
     reverseString(str:String(str.suffix(str.count-1)))
    print(str.first)
}

func lengthOfLongestSubstring(_ s: String) -> Int {
    let arr = Array(s)
    var maxi = 0
    for i in 0..<s.count {
        for j in i..<s.count {
            if checkRepetations(s: Array(arr[i ... j ])) {
               maxi = max(maxi, j-i+1)
            }
        }
    }
    return maxi
    }

func checkRepetations(s:[String.Element]) -> Bool {
    var dict = [String.Element:Int]()
    for e in s {
        if dict[e] == nil {dict[e] = 1} else {return false}
    }
    return true
}
func intToArray(int:Int)-> [Int]{
    var num = int
    
    
    var arr = [Int]()
    while num > 0 {
    var tmp = num%10
    arr.append(tmp)
        num = num/10}
    print(num)
    
    return arr
}
//intToArray(int: 123)
//func reverseInt(_ val:Int) {
//    var stack = [Int]()
//    var
//   // stack.append()
//}

//Backtracking - more then one solution
func permutation(_ l:Int,_ r:Int, _ arr:[Int]) -> [Int]{
    if l == r {
        print(arr)
        return arr}
    var inList  = arr
   
    for i in l..<r {
        inList = swap(i,l, inList)
        print(inList)
//        inList =  permutation(l+1, r, inList)
        inList = swap(i,l, inList)
    }
    return inList
}

func swap(_ i:Int,_ j:Int,_ arr:[Int])  -> [Int]{
    var list = arr
    let tmp = list[i]
    list[i] = list[j]
    list[j] = tmp
    
    return list
}

permutation(0, 3, [1,2,3])


 
