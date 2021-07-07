//
//  main.swift
//  Created by 오킹 on 2021/07/05.
//

import Foundation

//시도해본 첫번째 방법 : 완전탐색 - 시간초과
//func solution() -> Int {
//    var day = 1
//    var dayCount = 1
//    var inputFirst = Int(readLine()!)!
//    var inputSecond = readLine()?.components(separatedBy: " ").map{Int($0)!}
//    var test2 = inputSecond!.sorted(by: >)
//
//    while !isEnd {
//        for index in 0..<day {
//            if test2[index] != 0 {
//                test2[index] -= 1
//            }
//        }
//        if day != test2.count {
//            day += 1
//        }
//        dayCount += 1
//        if test2.filter{$0 != 0}.isEmpty {
//            isEnd = true
//        }
//    }
//
//    return dayCount+1
//}
//
//
//print(solution())


//시도해본 두번째 방법
//  1일 2일 3일 4일
//+ 4,  3,  3, 2
//----------------
//  5   5   6  6
// Max 값 = 6 + 1
func solution() -> Int {
    _ = Int(readLine()!)!
    let inputSecond = readLine()?.components(separatedBy: " ").map{Int($0)!}
    var max = 0
    var isEnd = false
    let result = inputSecond!.sorted(by: >)
    
    for index in 0..<inputSecond!.count {
        let tempMax = result[index] + (index+1)
        if max < tempMax {
            max = tempMax
        }
    }
    return max + 1
}

print(solution())

var test1 = 4
var test2 = [2, 3, 4, 3]
