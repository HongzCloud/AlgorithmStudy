//
//  main.swift
//  Avoidfood
//
//  Created by 오킹 on 2021/08/23.
// 문제 : https://www.acmicpc.net/problem/1743

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var map = Array(repeating: Array(repeating: 0, count: input[1]), count: input[0])
var points: [(col: Int, row: Int)] = [(Int,Int)]()
var result = 0

for _ in 0..<input[2] {
    let point = readLine()!.split(separator: " ").map{Int(String($0))!}
    points.append((col: point[1]-1,row: point[0]-1))
    map[point[0]-1][point[1]-1] = 1
}

func bfs(col: Int, row: Int) -> Int {
    var count = 0
    var queue = [(Int, Int)]()
    queue.append((row, col))
    
    while !queue.isEmpty {
        let dot = queue.removeFirst()
     
            count += 1
            for n in [(dot.0+1, dot.1),(dot.0-1, dot.1), (dot.0, dot.1+1), (dot.0, dot.1-1)] {
                if n.0 >= 0 && n.0 < map.count && n.1 >= 0 && n.1 < map[0].count && map[n.0][n.1] == 1 {
                    queue.append(n)
                    map[n.0][n.1] = 0
                }
            }
        }
    
    return count
}


for i in 0..<map.count {
    for j in 0..<map[0].count {
        if map[i][j] == 1 {
            map[i][j] = 0
            result = max(bfs(col: j, row: i), result)
        }
        
    }
}

print(result)
