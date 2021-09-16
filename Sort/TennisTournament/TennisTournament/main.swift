//
//  main.swift
//  TennisTournament
//
//  Created by 오킹 on 2021/09/16.
//

import Foundation

public func solution(_ P : Int, _ C : Int) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    return C < (P/2) ? C : (P/2)
}

public func solution(_ N : Int) -> Int {
    var out = 0

    for i in 2...N {
        //약수 판별, 2의 제곱수 판별
        if N % i == 0 && isSquareNumber(i) { out += 1 }
    }
    
    return out
}

func isSquareNumber(_ num : Int) -> Bool {
    return num & (num-1) == 0 ? true : false
}

print(isSquareNumber(2))
print(isSquareNumber(4))
print(isSquareNumber(8))
