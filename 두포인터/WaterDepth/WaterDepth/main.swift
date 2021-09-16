//
//  main.swift
//  WaterDepth
//
//  Created by 오킹 on 2021/09/15.
//

import Foundation


public func solution(_ A : [Int]) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    var maxIndex = A.firstIndex(of: A.max()!)!
    var water = 0
    
    var r = (A[maxIndex], maxIndex)

    while true {
        if r.1 == 0 { break }
        
        var leftMap = Array(A[0..<r.1])
        var leftWallIndex = leftMap.firstIndex(of: leftMap.max()!)!
        var leftWall = leftMap[leftWallIndex]
        
        water += (leftWall * (r.1 - leftWallIndex - 1))
        for i in (leftWallIndex+1)..<r.1 {
            water -= A[i]
        }
        r = (leftWall, leftWallIndex)
        maxIndex = leftWallIndex
    }
    
    maxIndex = A.firstIndex(of: A.max()!)!
    r = (A[maxIndex], maxIndex)
    while true {
        if r.1 == A.count { break }
        
        var leftMap = Array(A[r.1+1..<A.count])
        var leftWallIndex = leftMap.firstIndex(of: leftMap.max()!)!
        var leftWall = leftMap[leftWallIndex]
        
        water += (leftWall * (leftWallIndex - 1))
        for i in r.1+1..<(leftWallIndex) {
            water -= A[i+(A.count/2)]
        }
        r = (leftWall, leftWallIndex)
        maxIndex = leftWall
    }
  
    return water
}

var text = [1, 3, 2,1,2,1,5,3,3,4,2]
print(solution(text))
