//: [Previous](@previous)

import Foundation



func palindrome(_ str:String) -> Bool {
    var arr = Array(str)
    var l = 0
    var r = arr.count-1
    while l < r {
        if arr[l] != arr[r] {
            print("Not palindrome")
            
            return false
        }
        else {l+=1
            r-=1}
    }
    return true
}

func maxProduct(_ arr:[Int]) {
    var prod = arr[0]
    for i in 0 ..< arr.count {
        var mul = arr[i]
        for j in i+1 ..< arr.count{
            prod = max(prod, mul)
             mul = mul * arr[j]
        }
        prod = max(prod, mul)
    }
    print(prod)
}

func maxArea(_ height: [Int]) -> Int {
      var maxA = 0
    for i in 0..<height.count {
        var val = height[i]
        for j in i+1..<height.count {
            var heightval = j - i
            var min = min(height[j],val)
            var area  = min * heightval
            maxA = max(area, maxA)
        }
    }
    return maxA
  }

func maxAreaOpti(_ height: [Int]) -> Int {
    var maxA = 0
    var l = 0
    var r = height.count-1
    while(l<r){
        var area = min(height[l],height[r]) * (r-l)
        maxA = max(area,maxA)
        
        if height[l] > height[r] {
            r-=1
        }else {l+=1}
    }
    return maxA
}

func findSum(_ arr:[Int], _ sum:Int) {
    var sorted = arr.sorted()
    
    var l = 0
    var r = sorted.count-1
    
    while l < r {
        if sorted[l] + sorted[r] == sum {
            print("sum is::",sorted[l],sorted[r])
            return
        }
        if sorted[l] + sorted[r] < sum {
            l+=1
        }else { r-=1 }
    }
    print("not found")
}
func find3Sum(_ arr:[Int], _ sum:Int) {
    var sorted = arr.sorted()
    
    var l = 0
    var k = 1
    var r = sorted.count-1
    
    while l < r {
        if sorted[l] + sorted[k] + sorted[r] == sum {
            print("sum is::",sorted[l],sorted[k],sorted[r])
            return
        }
        if sorted[l] + sorted[k] + sorted[r] < sum {
            l+=1
            k+=1
        }else { r-=1 }
    }
    print("not found")
}

//Sliding window
func maxSum(_ arr:[Int],_ k:Int) {
    var j = 0
    var maxSum = 0
    while j <= arr.count-k {
        var start = j
        var end = j+k
        
        
        var sum = 0
        for i in start..<end {
            sum+=arr[i]
        }
        print(start,end)
        maxSum = max(sum, maxSum)
        
        j+=1
        
    }
    print(maxSum)
}

func findLongSub(_ str:String)  -> Int{
    var strArr = Array(str)
    var dict = [String.Element:Int]()
    var l = 0
    var r = 0
    var result = 0
    while r < strArr.count {
        
        if let val = dict[strArr[r]] {
            dict[strArr[r]]! = val + 1
        }else { dict[strArr[r]] = 1 }
        
        
        if let val = dict[strArr[r]], val > 1, var val1 = dict[strArr[l]] {
            dict[strArr[l]] = val1-1
            l+=1
        }
        result = max(result, r-l+1)
        r+=1
    }
    return result
}

func firstUniqChar(_ s: String) -> Int {
    var idx = 0
       var arr = Array(s)
    var dict = [String.Element:Int]()
    var queue = [Int]()
    
    for char in arr {
        if let val = dict[char] {
            dict[char] = val+1
        }else {dict[char] = 1}
    }
    
    for i in 0..<arr.count {
        if dict[arr[i]] == 1 {
            queue.append(i)
        }
    }
    //print(dict)
    
    return queue.first ?? -1
    
   }

firstUniqChar("aavbb")
