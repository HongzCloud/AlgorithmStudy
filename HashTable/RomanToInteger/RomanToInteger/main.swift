//
//  main.swift
//  RomanToInteger
//
//  Created by 오킹 on 2021/07/07.
// https://leetcode.com/problems/roman-to-integer/

import Foundation

class Solution {
    func romanToInt(_ s: String) -> Int {
        let romanTuple: [(Character, Int)] = [("M",1000), ("D",500), ("C",100), ("L",50),  ("X",10), ("V",5), ("I",1)]
        let sArr = Array(s)
        var out: [Int] = []

        
        for romanChar in sArr {
            for i in 0..<romanTuple.count {
                if romanChar == romanTuple[i].0 {
                    out.append(romanTuple[i].1)
                }
            }
        }
        
        for i in 1..<out.count {
            if out[i-1] < out[i] {
                out[i-1] = -out[i-1]
            }
        }
        
        return out.reduce(0, +)
    }
}

var input: String = "III"

import Foundation

class Solution2 {
    func romanToInt(_ s: String) -> Int {
        var answer = 0
        let romanDictionary: [Character:Int] = ["I":1, "V":5, "X":10, "L":50, "C":100, "D":500, "M":1000]
        let sArr = Array(s)
        var allNumber = [Int]()
        
        for element in sArr {
            var number = Int(romanDictionary[element]!)
            
            if let queueLastNumber = allNumber.last {
                if queueLastNumber < number {
                     allNumber[allNumber.endIndex-1] = -queueLastNumber
                }
            }
            allNumber.append(number)
        }
        
        answer = allNumber.reduce(0, +)
        return answer
    }
}
print(Solution2().romanToInt(input))
