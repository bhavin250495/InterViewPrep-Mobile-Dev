
import Foundation

/*
 Array representation of binary tree
 
           a
         /  \
        b   c
        /\   /\
        d  e f  g
 
 arr = [a,b,c,d,e,f,g]
 index=[0,1,2,3,4,5,6]
 Root = i
 left child = (2*i) + 1
 right child =  (2*i)+ 2
 parent = (i-1)/2
 
 * Binary Tree can have 2^(height+1) - 1 nodes *
 
 */


class MaxHeap {
    var heap = [Int]()
    
    //Insert at last
    //Then keep adjustung wit its parents until root node
    // Complexity: O(log n) -> Only traversing on parents & best case is O(1)
    // It is bottom-up approach, as we insert at bottom and follow our way towards top
    func insert(_ val:Int) {
        heap.append(val)
        adjustNodes(newEleIndex: heap.count-1)
    }
    
    // Only root element can be deleted from heap
    // It is replaced with last element and then adjusted from there
    // Compared with left and right nodes and swaped
    // Complexity O(log n)
    // Here the adjustment is done from top to bottom
    func delete() {
        let lastIndex = heap.count-1
        heap[0] = heap[lastIndex]
        heap = heap.dropLast()
        adjustLeftRight(current: 0)
    }
    

    
    func adjustLeftRight(current:Int) {

        if current>=heap.count { return }
        
        let leftIndex = leftNode(index: current)
        let rightIndex = rightNode(index: current)

        if leftIndex<heap.count, heap[current] < heap[leftIndex] {
            let temp = heap[leftIndex]
            heap[leftIndex] = heap[current]
            heap[current] = temp
            adjustLeftRight(current: leftIndex)
        }else if rightIndex<heap.count, heap[current] < heap[rightIndex]{
            let temp = heap[rightIndex]
            heap[rightIndex] = heap[current]
            heap[current] = temp
            adjustLeftRight(current: rightIndex)
        }
    }
    
    
    private func adjustNodes(newEleIndex:Int) {
        
        if newEleIndex == 0 { return }
        if heap.count < 2 {
            return
        }
        
        let parentIndex = getParent(index: newEleIndex)
        let latestInsert = heap[newEleIndex]
       
        let parent = heap[parentIndex]
        if parent < latestInsert {
            let temp = heap[parentIndex]
            heap[parentIndex] = heap[newEleIndex]
            heap[newEleIndex] = temp
        }
        
        adjustNodes(newEleIndex: parentIndex)
    }
    
    //Start from the leaf and move upwords
    func heapify() {
        
        for index in stride(from:heap.count/2, to: -1, by: -1){
            
            maxHeapify(index)
        }
        
    }
    
    // Find the largesst children, swap it with parent
    // Recursive adjust all the remaining after swapping
    func maxHeapify(_ idx:Int )  {
        let left = 2 * idx + 1
        let right = 2 * idx + 2
        var largest = idx
        if left < heap.count, heap[idx] < heap[left] {
            largest = left
        }
        if right < heap.count, heap[largest] < heap[right] {
            largest = right
        }
        if idx != largest {
            let temp = heap[idx]
            heap[idx] = heap[largest]
            heap[largest] = temp
        }
    }

    // Find the largesst children, swap it with parent
    // Recursive adjust all the remaining after swapping
    func minHeapify(_ idx:Int )  {
        let left = 2 * idx + 1
        let right = 2 * idx + 2
        var largest = idx
        if left < heap.count, heap[idx] > heap[left] {
            largest = left
        }
        if right < heap.count, heap[largest] > heap[right] {
            largest = right
        }
        if idx != largest {
            let temp = heap[idx]
            heap[idx] = heap[largest]
            heap[largest] = temp
        }
    }
    
    func getParent(index:Int)  -> Int  {
        return Int((index-1)/2)
    }
    func leftNode(index:Int) -> Int {
        return (2 * index) + 1
    }
    func rightNode(index:Int) -> Int {
        return (2 * index) + 2
    }
    func isLeaf(index:Int) -> Bool {
        if leftNode(index: index) < heap.count && rightNode(index: index) < heap.count {return true}
        return false
    }
}

//Complexity O(nlogn) since each operation in heap cose O(log n) so building a complete heap of n elements will be O(nlogn)
func heapSort() {
    let maxHeap = MaxHeap()
    maxHeap.insert(10)
    maxHeap.insert(20)
    maxHeap.insert(15)
    maxHeap.insert(30)
    maxHeap.insert(40)
    
    var sorted = [Int]()
    while(maxHeap.heap.count>0 ){
        sorted.insert(maxHeap.heap[0], at: 0)
        maxHeap.delete()
    }
    print(sorted)

}


class PriorityQueue{
    var heap = MaxHeap()
    //O(1)
    func peek() -> Int {
        return heap.heap[0]
    }
    //O(log n )
    func insert(_ val: Int) {
        heap.insert(val)
    }
    //O(log n)
    func delete() {
        heap.delete()
    }
}

var pQueue = PriorityQueue()
pQueue.insert(1)
pQueue.insert(10)
pQueue.insert(18)
pQueue.insert(19)
pQueue.insert(22)
pQueue.peek()
pQueue.delete()
pQueue.peek()
