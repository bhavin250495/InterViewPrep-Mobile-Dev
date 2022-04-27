//: [Previous](@previous)

import Foundation

//O(n^2)
//o(1)
func bubbleSort(arr:[Int]) {
    var sortedArr = arr
    var lentgh = sortedArr.count
    for i in 0..<sortedArr.count {
        for j in 0..<lentgh-1 {
            if sortedArr[j] > sortedArr[j+1] {
                //print("ss")
                var temp = sortedArr[j]
                sortedArr[j] = sortedArr[j+1]
                sortedArr[j+1] = temp
                //print(sortedArr)
            }
            
        }
        lentgh-=1
    }
    print(sortedArr)
}
//O(n^2)
//O(1)
func selectionSort(arr:[Int]) {
    var sortArr = arr
    var length = sortArr.count
    
    for i in 0 ..< sortArr.count {
        var min = i
        var pointer = sortArr[i]
        for j in  i ..< length {
            if sortArr[j] < sortArr[min] {
                min = j
            }
        }
            var temp = pointer
            sortArr[i] = sortArr[min]
            sortArr[min] = temp
           

    }
    print(sortArr)

}

// Backtracking
//O(n^2)

func insertionSort(arr: [Int]) {
    var sortArr = arr
    for i in 1..<sortArr.count {
        var key = sortArr[i]
        var j = i-1
        while(j>=0 && sortArr[j] > key) {
            var temp = sortArr[j]
            sortArr[j] = key
            sortArr[j+1] = temp
        j-=1
        }
    }
    print(sortArr)
}


class MergeSort {
    
    func sort(arr:[Int]) -> [Int]{
        if arr.count == 1 { return arr }
        var mid = Int(arr.count/2)
        var left = Array(arr[0 ..< mid])
        var right = Array(arr[mid...arr.count-1])
        let sortedList = merge(arr1: sort(arr:left), arr2: sort(arr:right))
        return sortedList
    }
    
    func merge(arr1:[Int],arr2:[Int]) -> [Int] {
        var left = arr1
        var right = arr2
        var sortArr = [Int]()
        var i = 0
        var j = 0
        
        while(i < arr1.count && j < arr2.count) {
            if left[i] < right[j] {
                sortArr.append(left[i])
                i+=1
            }else {
                sortArr.append(right[j])
                j+=1
            }
        }
        
        while(i < arr1.count) {
            sortArr.append(left[i])
            i+=1
        }
        while(j < arr2.count) {
            sortArr.append(right[j])
            j+=1
        }
                
        return sortArr
    }
}

class QuickSort {
    
    func sort(arr:[Int]) -> [Int] {
        if arr.count <= 1 {return arr}
        
        if arr.allSatisfy({$0 == arr.first}) {return arr}
        
        var pivot = Int(arr.count/2)
        var part = partition(pivot: pivot, arr: arr)
        
        var left = sort(arr: part.0)
        left.append(arr[pivot])
        var right = sort(arr: part.1)
        var sortedArr = [Int]()
        sortedArr.append(contentsOf: left)
        sortedArr.append(contentsOf: right)
        
        return sortedArr
    }
    
    func partition(pivot:Int,arr:[Int])-> ([Int],[Int]){
      //  print(pivot)
        print(arr[pivot])
        var left = [Int]()
        var right = [Int]()
        for i in 0..<arr.count {
            if arr[i] < arr[pivot]{
                left.append(arr[i])
            }else if arr[i] > arr[pivot] {
                right.append( arr[i])
            }
        }
        print(left,right)
        return (left,right)
    }
}
let ms = QuickSort()
ms.sort(arr: [22,5,4,3,2,1,1,10,11])
