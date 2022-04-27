//: [Previous](@previous)

import Foundation

//Pro: Adj List graph is used when we have space crunch
// Easy to find adj vertices



class Graph {
    var adjList: [Int:[Int]] = [:]
   
    
    /*Function to add an edge in an undirected graph*/
    func addEdge(src:Int,dest:Int, undirected:Bool = true) {
        
        if let vertices = adjList[src]{
            var v = vertices
            v.append(dest)
            adjList[src] = v
        }else {
            adjList[src] = [dest]
        }
        if undirected {
            if let vertices = adjList[dest]{
                var v = vertices
                v.append(src)
                adjList[dest] = v
            }else {
                adjList[dest] = [src]
            }
        }
      
    }
    
    func removeEdge(v1:Int, v2:Int) {
        if let vertices = adjList[v1]{
            if let index =  vertices.firstIndex(of: v2) {
                var v = vertices
                v.remove(at: index)
                adjList[v1] = v
            }
        }
        if let vertices = adjList[v2]{
            if let index =  vertices.firstIndex(of: v1) {
                var v = vertices
                v.remove(at: index)
                adjList[v2] = v
            }
        }
        
    }
    //Only the connected nodes will be visited, if we want to visit unconnected nodes loop over all vertices instead of starting point
    //Complexity O(V+E)
    func bfs(start:Int) {
        var visited = [Int]()
        var queue = [Int]()
        queue.append(start)
        visited.append(start)
        
        
        while !queue.isEmpty {
            let current = queue.first!
            print(current)
            queue = Array(queue.dropFirst())
            let adjNodes = adjList[current]!
            for val in adjNodes {
                if !visited.contains(val){
                    visited.append(val)
                    queue.append(val)
                }
            }
        }
    }
    //Complexity O(V+E), Space O(V) for eatra space for visted array
    func dfs(start:Int){
        var visited = [Int]()
        //To do all traversal for unconnected node run below function in loop till all vertices
        dfsUtil(node: start, visited: visited)
    }
    
    func dfsUtil(node:Int,visited:[Int]) {
        let adjNodes = adjList[node]!
        var v = visited
        print(node)
        v.append(node)
        for node in adjNodes {
            if !v.contains(node) {
                dfsUtil(node: node, visited: v)
            }
        }
        
    }
    
    func printGraph() {
        for vertices in adjList {
            print(vertices.key,vertices.value)
        }
    }
    
}


var adjList = Graph()
adjList.addEdge(src: 0, dest: 2,undirected: false)
adjList.addEdge(src: 0, dest: 1,undirected: false)
adjList.addEdge(src: 1, dest: 2,undirected: false)
adjList.addEdge(src: 1, dest: 3,undirected: false)
adjList.addEdge(src: 2, dest: 0,undirected: false)
adjList.addEdge(src: 3, dest: 3,undirected: false)
adjList.printGraph()
adjList.dfs(start: 2)
//adjList.printGraph()




// Adjecency matrix graph does lookup operationns in constant time, it is benificial to use when graph is dense
class AdjMatrixGraph {
    var adjMarix = [[Bool]]()
    
     init(numOfVertices:Int) {
        adjMarix = Array(repeating: Array(repeating: false, count: numOfVertices), count: numOfVertices)
    }
    
    func addEdge(v1:Int,v2:Int) {
        adjMarix[v1][v2] = true
        adjMarix[v2][v1] = true
    }
    
    func removeEdge(v1:Int,v2:Int) {
        adjMarix[v1][v2] = false
        adjMarix[v2][v1] = false
    }
    
    func printMatrix() {
        for i in 0..<adjMarix.count {
            for j in 0..<adjMarix[i].count {
                if adjMarix[i][j] {
                    print("Edges of \(i) ->", j)
                }
            }
        }
    }
    
}
//
//var adjMatrix = AdjMatrixGraph(numOfVertices: 4)
//adjMatrix.addEdge(v1: 0, v2: 3)
//adjMatrix.addEdge(v1: 0, v2: 2)
//adjMatrix.addEdge(v1: 0, v2: 1)
//adjMatrix.addEdge(v1: 1, v2: 2)
//
//adjMatrix.printMatrix()
