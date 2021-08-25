//
//  main.swift
//  RabbitsInForest
//
//  Created by 오킹 on 2021/08/25.
// 문제 : https://leetcode.com/problems/rabbits-in-forest/

import Foundation

class Solution {
    func numRabbits(_ answers: [Int]) -> Int {
        var rabits = [Int:Int]()
        var result = 0
        
        for i in answers {
            if rabits[i] != nil {
                rabits[i]! += 1
            } else {
                rabits[i] = 1
            }
        
            if rabits[i]! % (i+1) == 1 {
                result += i+1
            }
            
            if i == 0 {
                result += 1
            }
        }
 
        return result
    }
}
