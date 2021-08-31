//
//  main.swift
//  FindTheWinnerOfTheCircularGame
//
//  Created by 오킹 on 2021/08/31.
//

import Foundation

class Solution {
    func findTheWinner(_ n: Int, _ k: Int) -> Int {
        var queue = Array(1...n)
        var index = 1
        var out = 0
        
        while !queue.isEmpty {
            if index == k {
                out = queue.removeFirst()
                index = 0
            } else {
                queue.append(queue.removeFirst())
            }
            
            index += 1
        }
        
        return out
    }
}

let sol = Solution()
print(sol.findTheWinner(5, 2))
