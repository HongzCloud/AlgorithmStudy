//
//  main.swift
//  CompletenessOfBinaryTree
//
//  Created by 오킹 on 2021/06/26.
//https://leetcode.com/problems/check-completeness-of-a-binary-tree/

import Foundation


//Definition for a binary tree node.
  public class TreeNode {
      public var val: Int
      public var left: TreeNode?
      public var right: TreeNode?
      public init() { self.val = 0; self.left = nil; self.right = nil; }
      public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
      public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
          self.val = val
          self.left = left
          self.right = right
    }
  }
 
class Solution {
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        
        var queue = [TreeNode]()
        var result = [[Int]]()
        guard let myRoot = root else {
            return false
        }
        queue.append(myRoot)
        while queue.isEmpty == false {
            result.append(queue.map { $0.val })
                   print(result, "list")
            queue = queue.reduce([]) { l, t in
                       l + [t.left, t.right] // [] + [2,2] = [2,2]
                       }.flatMap({$0})
        }
        
        print(result)
        return true
    }
}

let testTree = TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3, TreeNode(6), nil))
print(Solution2().isCompleteTree(testTree))

class Solution2 {
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        
        var queue = [TreeNode]()
        var hasNil = false
        guard var currentNode = root else {
            return false
        }
        //왼쪽부터 다 있는지 검사
        queue.append(currentNode)
        
        while !queue.isEmpty {
            currentNode = queue.removeFirst()
            
            if currentNode.left == nil {
                hasNil = true
            } else {
                queue.append(currentNode.left!)
                if hasNil {
                                    return false
                                }
            }
            
            if currentNode.right == nil {
                hasNil = true
            } else {
                queue.append(currentNode.right!)
                if hasNil {
                    return false
                }
            }
        }
        return true
    }
}
