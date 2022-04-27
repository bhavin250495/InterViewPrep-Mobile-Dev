//: [Previous](@previous)

import Foundation


func findLucky(_ arr:[Int])-> Int{
    var dict = [Int:Int]()
    var result = -1
    
    for ele in arr {
        if dict[ele] == nil {
            dict[ele] = 1
        }else {
            var  count = dict[ele]!
            count += 1
            dict[ele] = count
            if ele == count, ele > result {
                result = ele
            }else if result < count {result = -1}
        }
    }
    return result
    
}

findLucky([2,2,2,3,3])

findLucky([5])

findLucky([1,2,2,3,3,3])

findLucky([2,2,3,4])


func generateParenthesis(_ n: Int) -> [String] {
      var ans = [String]()
      addParenthesis(0, open: n, close: n, ans: &ans, cur: "")
      return ans
  }

  private func addParenthesis(_ index: Int, open: Int, close: Int, ans: inout [String], cur: String) {
      guard open != 0 || close != 0 else {
          ans.append(cur)
          return
      }

      if open > 0 {
          addParenthesis(index + 1, open: open - 1, close: close, ans: &ans, cur: "\(cur)(")
      }

      if close > 0, close > open {
          addParenthesis(index + 1, open: open, close: close - 1, ans: &ans, cur: "\(cur))")
      }
  }

generateParenthesis(2)
