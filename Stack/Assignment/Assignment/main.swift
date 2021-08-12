//
//  main.swift
//  Assignment
//
//  Created by 오킹 on 2021/08/12.
// 문제 : https://www.acmicpc.net/problem/17952
// 결과 : 1108ms 시간제한 2000ms
import Foundation

//스택이용 - 시간초과
func assignmentResult() -> Int {
    var assignmentCount = Int(readLine()!)!
    var result = 0
    
    var stack = [(Int,Int)]()
    while assignmentCount > 0 {
        //SubString -> String으로 바꿔줘야 통과함 이유: https://icksw.tistory.com/218
        var assignmentInput = readLine()!.split(separator: " ").map{Int($0)!}
        
        if assignmentInput.first == 1 {
            stack.append((assignmentInput[1], assignmentInput[2]))
        }
        
        if !stack.isEmpty {
            var endIndex = stack.endIndex-1
            stack[endIndex].1 -= 1
            
            if stack[endIndex].1 == 0 {
                result += stack.popLast()!.0
            }
        }
        
        assignmentCount -= 1
    }
    
    print(result)
    return result
}

assignmentResult()
