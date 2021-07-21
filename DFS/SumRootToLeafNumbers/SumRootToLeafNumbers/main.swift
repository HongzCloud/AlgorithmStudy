//
//  main.swift
//  SumRootToLeafNumbers
//
//  Created by 오킹 on 2021/07/21.
// 문제 : https://leetcode.com/problems/sum-root-to-leaf-numbers/submissions/

//아 처음에 레벨순회(BFS)로 TreeNode를 배열로 바꾼후 부모노드인덱스 = 자식노드인덱스/2 로 해서
//값을 구하려 했는데.. 부모노드인덱스 = 자식노드인덱스/2의 특징은 완전이진트리에서만 쓸 수 있었다.
//이 문제는 그냥 이진트리이다. 이것을 완전이진트리로 바꾸려면 결국 깊이우선탐색을해서 제일 깊은 레벨이 몇인지 알아내야만
//이진트리를 완전이진트리로 바꿀 수가 있는데 너무 빙빙 돌아가는 거 같아서 결국 다른 방법을 생각해 내야 했다.
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
    //오른쪽 노드부터 돌려면 스택, 왼쪽부터면 큐
    func sumNumbers(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var queue = [(TreeNode, Int)]()
        queue.append((root, 0))
        var result = 0
        
        while !queue.isEmpty {
            let (node, val) = queue.removeFirst()
            let sum = 10 * val + node.val
            
            if node.left == nil && node.right == nil {
                result += sum
            }
            
            if node.left != nil {
                queue.append((node.left!, sum))
            }
            
            if node.right != nil {
                queue.append((node.right!, sum))
            }

        }
        return result
    }
}
var sol = Solution()
//print(sol.sumNumbers(TreeNode(1, TreeNode(2), TreeNode(3))))
print(sol.sumNumbers(TreeNode(4, TreeNode(9, TreeNode(5), TreeNode(1)), TreeNode(0))))
//print(sol.sumNumbers(TreeNode(2, TreeNode(1, TreeNode(4, TreeNode(7, TreeNode(4, TreeNode (8), nil), nil), nil), nil), nil)))
