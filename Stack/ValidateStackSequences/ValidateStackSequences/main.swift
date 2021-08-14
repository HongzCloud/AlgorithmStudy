//
//  main.swift
//  ValidateStackSequences
//
//  Created by 오킹 on 2021/08/14.
// 문제 : https://leetcode.com/problems/validate-stack-sequences/

import Foundation

class Solution {
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        var result = [Int]()
        var index = 0
        
        for element in pushed {
            result.append(element)
            
            while !result.isEmpty && result.last ==  popped[index] {
                result.removeLast()
                index += 1
            }
        }

        return result.count == 0
    }
}
