//
//  main.swift
//  BOJStreet
//
//  Created by 오킹 on 2021/09/14.
//

import Foundation


//DP
let firstInput = Int(readLine()!)!
let street = readLine()!.map{ String($0) }
var answer = Array(repeating: 0, count: street.count)

func check(cur: String, next: String) -> Bool {
    if cur == "B" && next == "O" { return true }
    if cur == "O" && next == "J" { return true }
    if cur == "J" && next == "B" { return true }
    return false
}

for i in 1..<answer.count {
    answer[i] = 10000000
}

for j in 1..<street.count {
    for i in 0..<j {
        if check(cur: street[i], next: street[j]) {
            let k = j-i
            answer[j] = min(answer[j], answer[i] + (k*k))
        }
    }
}

answer[firstInput-1] == 10000000 ? print(-1) : print(answer[firstInput-1])
