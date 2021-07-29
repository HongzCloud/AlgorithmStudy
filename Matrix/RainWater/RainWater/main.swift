//
//  main.swift
//  RainWater
//
//  Created by 오킹 on 2021/07/29.
// 문제 : https://www.acmicpc.net/problem/14719

import Foundation

func checkRainWater() -> Int {
    var mapInfo = readLine()!.components(separatedBy: " ").map{Int($0)!}
    let wall = readLine()!.components(separatedBy: " ").map{Int($0)!}
    let width = mapInfo[0]
    let columns = mapInfo[1]

    var result = 0
    var map = Array(repeating: Array(repeating: 0, count: columns), count: width)

    //벽 채우기 : 1
    for column in 0..<columns {
        for row in 0..<wall[column] {

            map[width-1-row][column] = 1
        }
    }
    
    for row in 0..<width {
        var startIndex = -1
        var endIndex = -1

        for elementIndex in 0..<map[row].count {
            //벽이 있는 곳 : 1
            if map[row][elementIndex] == 1 {
                if startIndex == endIndex {
                    startIndex = elementIndex
                } else {
                    endIndex = elementIndex

                    for index in startIndex+1..<endIndex {
                        //물이 고인곳 : 2
                        map[row][index] = 2
                        result += 1
                    }
                    startIndex = endIndex
                    endIndex = -1
                }

            }
        }
    }

    return result
}

print(checkRainWater())

