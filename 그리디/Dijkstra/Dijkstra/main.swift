//
//  main.swift
//  Dijkstra
//
//  Created by 오킹 on 2021/07/02.
//https://programmers.co.kr/learn/courses/30/lessons/12978

import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {

    //시작노드
    var start = 1
    var connections = road
    var result = [Int]()
    var queue = [start]
    var allDistances2 = Array(repeating: Int.max, count: N+1)
    allDistances2[start] = 0
    
    while !queue.isEmpty {
        var currentNode = queue.removeFirst()
        var filteredConnections = connections.filter{ $0[0] == currentNode || $0[1] == currentNode }
        
        for connection in filteredConnections {
            let nextNode = currentNode == connection[0] ? connection[1] : connection[0]
            
            if allDistances2[currentNode] + connection[2] < allDistances2[nextNode] {
                allDistances2[nextNode] = allDistances2[currentNode] + connection[2]
                queue.append(nextNode)
            }
            
        }
    }
    
    return allDistances2.filter{$0<=k}.count
}

solution(6, [[1,2,1],[1,3,2],[2,3,2],[3,4,3],[3,5,2],[3,5,3],[5,6,1]], 4)
