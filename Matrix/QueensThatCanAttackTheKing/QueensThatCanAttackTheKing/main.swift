//
//  main.swift
//  QueensThatCanAttackTheKing
//
//  Created by 오킹 on 2021/07/28.
// 문제 :

import Foundation

class Solution {
    func queensAttacktheKing(_ queens: [[Int]], _ king: [Int]) -> [[Int]] {
        //2차원 배열 초기화
        var matrix = Array(repeating: Array(repeating: 0, count: 8), count: 8)
        var row = king[0]
        var column = king[1]
        var result = [[Int]]()
        for queen in queens {
            matrix[queen[0]][queen[1]] = 1
        }
        matrix[king[0]][king[1]] = 2
        
        //위쪽에 1 있는 지 검사
        while row >= 0 {
            if matrix[row][column] == 1 {
                result.append([row, column])
                break
            }
            row -= 1
        }
        
        row = king[0]
        
        //아래쪽에 1 있는 지 검사
        while row <= 7  {
            if matrix[row][column] == 1 {
                result.append([row, column])
                break
            }
            row += 1
        }
        
        row = king[0]
        
        //왼쪽에 1 있는 지 검사
        while column >= 0 {
            if matrix[row][column] == 1 {
                result.append([row,column])
                break
            }
            column -= 1
        }
        
        column = king[1]
        //오른쪽에 1 있는 지 검사
        while column <= 7 {
            if matrix[row][column] == 1 {
                result.append([row,column])
                break
            }
            column += 1
        }
        
        column = king[1]
        
        //왼쪽대각선 위에 1 있는 지 검사
        while row >= 0 && column >= 0 {
            if matrix[row][column] == 1 {
                result.append([row,column])
                break
            }
            row -= 1
            column -= 1
        }
        
        row = king[0]
        column = king[1]
        
        //왼쪽대각선 아래에 1 있는 지 검사
        while row <= 7 && column >= 0 {
            if matrix[row][column] == 1 {
                result.append([row,column])
                break
            }
            row += 1
            column -= 1
        }
        
        row = king[0]
        column = king[1]
        
        //오른쪽대각선 아래에 1 있는 지 검사
        while row <= 7 && column <= 7 {
            if matrix[row][column] == 1 {
                result.append([row,column])
                break
            }
            row += 1
            column += 1
        }
        
        row = king[0]
        column = king[1]
        
        //오른대각선 위에 1 있는 지 검사
        while row >= 0 && column <= 7 {
            if matrix[row][column] == 1 {
                result.append([row,column])
                break
            }
            row -= 1
            column += 1
        }

        return result
    }
}

let sol = Solution()
let queens = [[0,0],[1,1],[2,2],[3,4],[3,5],[4,4],[4,5]]
let king = [3,3]

//print(sol.queensAttacktheKing(queens, king)) //Output: [[2,2],[3,4],[4,4]]

let q2 = [[5,6],[7,7],[2,1],[0,7],[1,6],[5,1],[3,7],[0,3],[4,0],[1,2],[6,3],[5,0],[0,4],[2,2],[1,1],[6,4],[5,4],[0,0],[2,6],[4,5],[5,2],[1,4],[7,5],[2,3],[0,5],[4,2],[1,0],[2,7],[0,1],[4,6],[6,1],[0,6],[4,3],[1,7]]
let k2 = [3,4]
print(sol.queensAttacktheKing(q2, k2)) //Output: [[2,2],[3,4],[4,4]]

