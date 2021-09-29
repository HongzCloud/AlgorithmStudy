//
//  main.swift
//  LockAndKey
//
//  Created by 오킹 on 2021/09/30.
//

import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    let interval = key.count-1
    let centerLock = setCenter(lock: lock, interval: interval)
    var myKey = key

    for _ in 0..<4 {
        for row in 0..<lock.count + interval {
            for col in 0..<lock[0].count + interval {
                
                let myLock = insertedLock(centerLock: centerLock,
                           key: myKey,
                           startRow: col,
                           startCol: row,
                           interval: interval)

                if canUnlock(insertedLock: myLock, interval: interval) {
                    return true
                }
            }
        }
        myKey = rotate(key: myKey)
    }
    return false
}

//중앙에 배치
func setCenter(lock: [[Int]], interval: Int) -> [[Int]] {
    let maxLengthCount = lock.count + ((interval)*2)
    var out = Array(repeating: Array(repeating: 0, count: maxLengthCount), count: maxLengthCount)
    
    for row in interval..<(maxLengthCount - interval) {
        for col in interval..<(maxLengthCount - interval) {
            out[col][row] = lock[col-interval][row-interval]
        }
    }
    return out
}

//90도 회전
func rotate(key: [[Int]]) -> [[Int]] {
    let n = key.count
    let m = key[0].count
    var result = Array(repeating: Array(repeating: 0, count: m), count: n)
    for i in 0...n - 1 {
        for j in 0...m - 1 {
            result[j][n - i - 1] = key[i][j]
        }
    }
    return result
}

//열쇠 꼽기
func insertedLock(centerLock: [[Int]], key: [[Int]], startRow: Int, startCol: Int, interval: Int) -> [[Int]] {
    var insertedLock = centerLock
    var out = centerLock
    for i in startRow...startRow+interval {
        for j in startCol...startCol+interval {
            insertedLock[j][i] = insertedLock[j][i] ^ key[j-startCol][i-startRow]
        }
    }
    return insertedLock
}

func canUnlock(insertedLock: [[Int]], interval: Int) -> Bool {
    for i in interval..<insertedLock.count-interval {
        for j in interval..<insertedLock.count-interval {
            if insertedLock[j][i] == 0 {return false}
        }
    }
    return true
}

print(solution([[0, 0, 0], [1, 0, 0], [0, 1, 1]], [[1, 1, 1], [1, 1, 0], [1, 0, 1]]))
