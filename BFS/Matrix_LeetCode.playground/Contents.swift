
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
                //거리
                var depth = 0
                //거리 1(다른숫자가될 수도) 인것들 다 돌았는지 확인하기 위한 변수
                var size = 1
                //확인해야할 것들을 담아둠 (BFS특징)
                var elements = [Coordinate(row: row, column: column)]
                //이미 체크한 곳인지 확인할 변수 (BFS특징)
                var visited = Array(repeating: Array(repeating: false, count: mat.count), count: mat[0].count)
                
                while !elements.isEmpty {
                    
                    size -= 1
                    //구문 종료 직전에 실행됨
                    defer {
                        if size == 0 {
                            depth += 1
                            size = elements.count
                        }
                    }
                    
                    //거리가 n인것들 중 하나 꺼내기
                    let element = elements[0]
                    elements.remove(at: 0)
                    
                    //꺼낸것이 방문했었는지 체크
                    guard !visited[element.row][element.column] else { continue }
                    visited[element.row][element.column] = true
                    
                    //꺼낸것이 0이면 result[row][column]자리에 거리를 넣어줌
                    guard mat[element.row][element.column] != 0 else {
                        result[row][column] = depth
                        break
                    }
                    
                    //꺼낸것이 1이면 1꺼낸자리의 상하좌우를 elements에다가 넣음
                    let neighbours = element.neighbours(rowsCount: rowsCount, columnsCount: columnsCount)
                    elements.append(contentsOf: neighbours)
                }
            }
        }
        return result
    }
    
    //현재노드의 상하좌우의 인덱스를 계산하는 구조체
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
