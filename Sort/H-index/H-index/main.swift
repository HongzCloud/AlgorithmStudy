//
//  main.swift
//  H-index
//
//  Created by 오킹 on 2021/07/19.
// 문제 : https://programmers.co.kr/learn/courses/30/lessons/42747

import Foundation

func solution(_ citations:[Int]) -> Int {
    var sorted = citations.sorted(by: >)
    
    for index in 0..<citations.count {
        if (sorted[index] <= index) {
          return index
        }
    }

    return sorted.count
}

print(solution([3,0,6,1,5])) // 3
print(solution([1545, 2, 999, 790, 540, 10, 22])) // 6
print(solution([6,6,6,6,6,6])) // 6
