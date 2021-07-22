//
//  main.swift
//  RemoveNthNodeFromEndoFList
//
//  Created by 오킹 on 2021/07/22.
// 문제 : https://leetcode.com/problems/remove-nth-node-from-end-of-list/submissions/

import Foundation


//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

//배열 이용
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let head = head else { return ListNode(0)}
        var currentHead = head
        var arr = [Int]()
        var result = ListNode()
        
        if currentHead.next == nil {
            return nil
        }
        
        while currentHead.next != nil {
            arr.append(currentHead.val)
            currentHead = currentHead.next!
        }
     
        arr.append(currentHead.val)
        arr.remove(at: arr.count-n)
        result.val = arr[0]
        
        var nodeList = arr.map{ListNode($0)}
        for index in 1..<nodeList.count {
            nodeList[index-1].next = nodeList[index]
        }
        
        print(arr)
        return nodeList[0]
    }
    
}

//링크드리스트 삭제
class Solution2 {
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var count = 1
        guard let head = head else {
            return nil
        }
        
        var currentNode = head
        while currentNode.next != nil {
            count += 1
            currentNode = currentNode.next!
        }
        
        guard count != 1 else {
            return nil
        }
        currentNode = head
        
        var nth = count - n
        guard nth != 0 else { return head.next}
        
        for num in 1..<nth {
            currentNode = currentNode.next!
        }
        currentNode.next = currentNode.next?.next
        
        return head
    }
}


var sol = Solution()
//print(sol.removeNthFromEnd2(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5))))), 2))
//print(sol.removeNthFromEnd(ListNode(1), 1))
print(sol.removeNthFromEnd(ListNode(1, ListNode(2)), 1))
