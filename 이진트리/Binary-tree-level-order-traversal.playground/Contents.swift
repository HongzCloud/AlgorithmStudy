//https://leetcode.com/problems/binary-tree-level-order-traversal/
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
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
     
        var q = [TreeNode]()
        var lists = [[Int]]()
        q.append(root)
     
        while !q.isEmpty {
            lists.append(q.map { $0.val })
            print(lists, "list")
            q = q.reduce([]) { l, t in
                l + [t.left, t.right] // [] + [2,2] = [2,2]
                }.compactMap({$0})
        }
        
        return lists
    }
    
}

var rootTest = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
var tlal = TreeNode(3, TreeNode(2, TreeNode(10), TreeNode(10)), TreeNode(2, TreeNode(10), TreeNode(10)))

Solution().levelOrder(tlal)
