
//https://leetcode.com/problems/01-matrix/

import Foundation

let mat = [[0,0,0],[0,1,0],[0,0,0]]
let mat2 = [[0,0,0],[0,1,0],[1,1,1]]
let mat3 = [[1,1,1,1,1,0,1,0,1,0,1,0,1,1,0,1,1,1,0,1,1,1,0,1,1,1,1,0,1,1],[1,1,1,0,1,1,0,0,0,0,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,0,1,0,0,1],[1,1,1,1,0,1,0,0,1,1,0,1,1,0,1,1,1,0,1,0,1,0,0,1,0,1,0,1,1,1],[1,1,1,1,1,0,1,1,1,1,1,0,1,1,0,0,0,0,1,0,0,0,0,1,1,1,1,0,0,1],[0,1,0,0,1,0,0,1,1,1,0,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,1,1,0,1],[1,0,1,1,1,1,0,1,0,1,0,1,1,1,0,1,1,1,1,0,1,1,0,1,0,1,0,0,1,0],[1,1,0,1,1,0,0,0,1,1,0,0,0,1,0,1,1,1,1,1,0,1,0,1,1,0,1,1,1,1],[1,1,1,0,0,0,1,0,0,1,1,1,1,1,1,1,1,0,1,0,1,0,0,1,0,0,1,0,0,1],[0,1,1,0,1,1,1,0,1,0,1,1,0,1,1,1,1,0,1,0,1,1,1,1,1,0,0,1,0,1],[1,1,0,0,1,1,1,0,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,0,0,0,0,1,1],[1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,0,1,1,1,0,1,1,0,1,0,1,1,1,0],[1,1,1,1,0,1,0,0,0,1,1,1,0,1,1,1,0,1,0,1,1,1,0,1,0,1,1,1,1,1],[0,1,1,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,1,0,1,1,1,1,0,1,0,0,0,1],[0,1,1,0,0,0,1,1,0,0,0,0,1,1,0,1,1,1,1,1,1,1,0,1,0,0,1,1,1,1],[1,1,1,1,0,0,1,1,1,0,0,1,1,0,1,1,1,0,0,1,1,0,1,0,0,0,0,1,1,1],[1,1,1,1,0,1,1,0,1,1,0,1,1,1,1,1,1,1,0,0,0,0,1,1,0,0,1,0,0,0],[1,1,0,1,1,0,0,1,1,0,0,1,0,1,1,1,1,0,1,1,1,0,1,1,0,1,0,1,0,1],[1,0,0,0,1,1,1,0,1,1,1,1,0,0,1,1,1,0,1,1,0,1,0,0,1,1,1,1,1,0],[1,1,0,1,0,1,1,0,0,1,1,0,0,1,0,1,1,1,1,1,1,0,1,0,0,0,0,1,1,1],[1,1,1,0,1,0,1,0,1,0,1,0,1,1,0,1,0,0,1,1,1,0,1,1,0,1,0,1,1,0],[1,0,0,1,1,1,1,0,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,1,1,0,1,1],[0,1,1,1,1,0,1,1,0,1,1,1,1,1,1,0,1,0,0,1,0,1,1,0,1,1,0,1,0,1],[1,1,1,0,1,1,1,0,0,1,0,0,0,1,1,1,1,0,1,1,1,0,1,1,1,1,1,1,1,1],[1,1,0,0,1,1,1,1,0,0,1,0,0,1,1,0,0,1,1,1,1,0,1,1,0,1,1,1,1,1],[0,0,0,1,1,1,1,1,1,0,1,1,1,0,0,1,1,1,1,1,1,1,0,1,0,0,0,1,1,0],[1,1,0,1,1,1,1,1,1,1,1,0,1,1,0,0,1,1,1,1,0,1,0,0,0,0,0,1,1,1],[1,0,1,1,0,1,1,0,1,0,1,1,1,0,1,1,1,1,1,0,1,0,0,1,1,0,0,1,1,0],[1,1,1,0,0,1,1,1,1,0,1,0,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1],[1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,0,1,1,0,1,1,1,1,1,1,0,0,1,1,1],[0,1,1,0,1,1,0,0,1,0,1,1,1,1,0,0,1,1,1,1,1,1,0,0,0,1,1,0,1,0]]

//BFS
class Solution {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        let rowsCount = mat.count
        let columnsCount = mat[0].count
        var result = mat
       
        for row in 0..<mat.count {
            for column in 0..<mat[0].count {
                let value = mat[row][column]
                guard value != 0 else { continue }
                //??????
                var depth = 0
                //?????? 1(?????????????????? ??????) ????????? ??? ???????????? ???????????? ?????? ??????
                var size = 1
                //??????????????? ????????? ????????? (BFS??????)
                var elements = [Coordinate(row: row, column: column)]
                //?????? ????????? ????????? ????????? ?????? (BFS??????)
                var visited = Array(repeating: Array(repeating: false, count: mat.count), count: mat[0].count)
                
                while !elements.isEmpty {
                    
                    size -= 1
                    //?????? ?????? ????????? ?????????
                    defer {
                        if size == 0 {
                            depth += 1
                            size = elements.count
                        }
                    }
                    
                    //????????? n????????? ??? ?????? ?????????
                    let element = elements[0]
                    elements.remove(at: 0)
                    
                    //???????????? ?????????????????? ??????
                    guard !visited[element.row][element.column] else { continue }
                    visited[element.row][element.column] = true
                    
                    //???????????? 0?????? result[row][column]????????? ????????? ?????????
                    guard mat[element.row][element.column] != 0 else {
                        result[row][column] = depth
                        break
                    }
                    
                    //???????????? 1?????? 1??????????????? ??????????????? elements????????? ??????
                    let neighbours = element.neighbours(rowsCount: rowsCount, columnsCount: columnsCount)
                    elements.append(contentsOf: neighbours)
                }
            }
        }
        return result
    }
    
    //??????????????? ??????????????? ???????????? ???????????? ?????????
    struct Coordinate {
        let row: Int
        let column: Int
        
        init(row: Int, column: Int) {
            self.row = row
            self.column = column
        }
        
        func neighbours(rowsCount: Int, columnsCount: Int) -> [Coordinate] {
            var result = [Coordinate]()
            if let t = top() {
                result.append(t)
            }
            if let b = bottom(rowsCount: rowsCount) {
                result.append(b)
            }
            if let l = left() {
                result.append(l)
            }
            if let r = right(columnsCount: columnsCount) {
                result.append(r)
            }
            
            return result
        }
        
        func top() -> Coordinate? {
            guard row > 0 else { return nil }
            return Coordinate(row: row-1, column: column)
        }
        
        func bottom(rowsCount: Int) -> Coordinate? {
            guard row < rowsCount-1 else { return nil }
            return Coordinate(row: row+1, column: column)
        }
        
        func left() -> Coordinate? {
            guard column > 0 else { return nil }
            return Coordinate(row: row, column: column-1)
        }
        
        func right(columnsCount: Int) -> Coordinate? {
            guard column < columnsCount-1 else { return nil }
            return Coordinate(row: row, column: column+1)
        }
    }
}



let sol = Solution()
print(sol.updateMatrix(mat3))
