import UIKit
class ArrayProblems {
    //Addtional problem to practice
    
    
    
    func findSum(arr:[Int],sum:Int) {
        var dict = [Int:Int]()
        for i in 0..<arr.count {
            if dict[sum-i] != nil {
                print(dict[sum-arr[i]],i)
                print(arr[dict[sum-arr[i]]!],arr[i])
                return
            }
            dict[arr[i]] = i
        }
        //O(n)
    }
    //https://deloittedevelopment.udemy.com/course/master-the-coding-interview-data-structures-algorithms/learn/lecture/12310382#questions/11609088
    func reverseProblem() {
        ///Reverse a string
        var greeting = Array("Hello, playground")
        var reversed = [Character]()


        for i in 0..<greeting.count {
            reversed.append(greeting[(greeting.count-1)-i])
        }
        print(greeting)
        print(String(reversed))
        // O(n)
    }
    
    func mergeSortedArrays(arr1: [Int], arr2: [Int]) {
        var mergedArray = [Int]()
        var arr1Item = arr1.first ?? 0
        var arr2Item = arr2.first ?? 0
        var index1 = 0
        var index2 = 0
        
        while((index1 < arr1.count) && (index2 < arr2.count)) {
            
            if arr2Item > arr1Item {
                mergedArray.append(arr1Item)
                index1+=1
                guard arr1.indices.contains(index1) else { continue }
                arr1Item = arr1[ index1]
            }else {
                mergedArray.append(arr2Item)
                index2+=1
                guard arr2.indices.contains(index2) else { continue }
                arr2Item = arr2[ index2]
            }
        }
       // mergedArray.append( arr1Item)
        while index1 < arr1.count {
            guard arr1.indices.contains(index1) else { continue }
            mergedArray.append(arr1[index1])
            index1+=1
        }
        while index2 < arr2.count {
            print(index2)
            guard arr2.indices.contains(index2) else { continue }
            mergedArray.append(arr2[index2])
            index2+=1
            
            
        }
   // mergedArray.append( arr2Item)
    print(mergedArray)
        //O(n)
                
    }
    //O(n^2)
    func maximumDifference(arr: [Int]) {
        var max = 0
        for i in 0 ..< arr.count {
            for j in i+1 ..< arr.count {
                let sum = arr[j] - arr[i]
                if sum > max {
                    max = sum
                }
            }
        }
        print(max)
    }
    
    func maximumDifferenceO(arr:[Int]) {
        //maintian 2 pointer max and min
        var maxDiff = arr[1] - arr[0]
        var min = arr[0]
       
        
        for i in 1 ..< arr.count {
            if arr[i] - min > maxDiff {
                maxDiff = arr[i] - min
            }
            if arr[i] < min {
                min = arr[i]
            }
        }
        print(maxDiff)
    }
    

    
    //https://www.pepcoding.com/resources/online-java-foundation/dynamic-programming-and-greedy/maximum_sum_non_adjacent_elements/topic
    func maxAdjSum(arr:[Int]) {
       var inc = arr[0]
        var exc = 0
        for i in 1 ..< arr.count {
            print(inc,exc)
            let temp = arr[i] + exc
            exc = max(inc,exc)
            inc = temp
            
        }
        print(max(inc,exc))
    }
    
}

let prob = ArrayProblems()
prob.maxAdjSum(arr: [5,10,10,100,15])

