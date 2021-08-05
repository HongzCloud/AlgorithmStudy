//
//  main.swift
//  LineUp
//
//  Created by 오킹 on 2021/08/05.
// 문제 : https://www.acmicpc.net/problem/2252

import Foundation

var n = 0
var entrie: [Int]!
var infomation: [[Int]]!

func sol() {
    var firstInput = readLine()!.components(separatedBy: " ").map{Int($0)!}
    var zeroQueue = [Int]()
    n = firstInput[0]
    entrie = [Int](repeating: 0, count: n+1)
    infomation = [[Int]](repeating: [Int](), count: n+1)
    var result = [Int]()
    
    var queuePointer = 0

    for index in 0..<firstInput[1] {
        let nodes: [Int] = readLine()!.components(separatedBy: " ").map{Int($0)!}
        infomation[nodes[0]].append(nodes[1])
        entrie[nodes[1]] += 1
    }
    
    for (zeroEntryIndex, enter) in entrie.enumerated() where enter == 0 && zeroEntryIndex != 0 {
            zeroQueue.append(zeroEntryIndex)
    }

    while queuePointer < zeroQueue.count {
             let node = zeroQueue[queuePointer]
             queuePointer += 1
             result.append(node)
             infomation[node].forEach { degree in
                 entrie[degree] -= 1
                 if entrie[degree] == 0 {
                     zeroQueue.append(degree)
                 }
             }
         }
    
    print(result.reduce(into: "", { $0 += "\($1) "}).dropLast())
}

sol()
