//
//  main.swift
//  DailyTemperatures
//
//  Created by 오킹 on 2021/08/09.
//

import Foundation

class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var stack: [Int] = []
        var result = [Int](repeating: 0, count: temperatures.count)
        
        for i in 0..<temperatures.count {
            while !stack.isEmpty && temperatures[i] > temperatures[stack.last!] {
                let index = stack.removeLast()
                result[index] = i - index
            }
            stack.append(i)
        }
         return result
    }
}
