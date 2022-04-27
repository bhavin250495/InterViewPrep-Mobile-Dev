//: [Previous](@previous)

import Foundation

func binarySearch(arr:[Int],ele:Int) -> Bool {
    if arr.count == 1 {
        if arr.first == ele {return true}
        return false
    }
    let pivot = Int(arr.count/2)
    
    if ele < pivot {
        return binarySearch(arr: Array(arr[0 ..< pivot]), ele: ele)
    }else {
        return binarySearch(arr: Array(arr[pivot ..< arr.count]), ele: ele)
    }
}


func binarySearchL(_ l:Int,_ r:Int,arr:[Int],ele:Int) -> Int{
    var l = l
    var r = r
    while l < r {
        let mid = (l+r)/2
        print(mid)
      //  print(arr[mid])
        if arr[mid] == ele {return mid }
        
        if ele > arr[mid]{
            l = mid+1
        }else {
            r = mid-1
            
        }
    }
    return -1
}


binarySearchL(0,3,arr: [1,2,3], ele: 3)
