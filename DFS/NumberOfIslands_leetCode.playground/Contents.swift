//https://leetcode.com/problems/number-of-islands/

import UIKit

let test: [[Character]] = [
    ["1","1","1","1","0"],
    ["1","1","0","1","0"],
    ["1","1","0","0","0"],
    ["0","0","0","0","0"]
  ]

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var rows = grid.count
        var columns = grid[0].count
        var myGrid = grid
        var count = 0

        func doubleCheck(row: Int, column: Int) {
            myGrid[row][column] = "2"
                    if(row < myGrid.count - 1 && myGrid[row+1][column] == "1"){
                        doubleCheck(row: row+1,column: column); // 상
                    }
                    if(row > 0 && myGrid[row-1][column] == "1"){
                        doubleCheck(row: row-1,column: column); // 하
                    }
                    if(column > 0 && myGrid[row][column-1] == "1"){
                        doubleCheck(row: row,column: column-1); // 좌
                    }
                    if(column < myGrid[0].count - 1 && myGrid[row][column+1] == "1"){
                        doubleCheck(row: row, column: column+1); //우
                    }
        }
        
        for row in 0..<rows {
            for column in 0..<columns {
                if myGrid[row][column] == "1" {
                    count += 1
                    doubleCheck(row: row, column: column)
                }

            }


        }

        return count
    }
}
//class Solution {
//    var myGrid = [[Character]]()
//
//    func numIslands(_ grid: [[Character]]) -> Int {
//        var rows = grid.count
//        var columns = grid[0].count
//        myGrid = grid
//        var count = 0
//
//        for row in 0..<rows {
//            for column in 0..<columns {
//                if myGrid[row][column] == "1" {
//                    count += 1
//                    doubleCheck(myGrid2: myGrid, row: row, column: column)
//                }
//
//            }
//
//
//        }
//
//
//
//        print(count)
//        return count
//    }
//
//    func doubleCheck(myGrid2: [[Character]], row: Int, column: Int) {
//        self.myGrid[row][column] = "2"
//                if(row < myGrid.count - 1 && myGrid[row+1][column] == "1"){
//                    doubleCheck(myGrid2: myGrid2, row: row+1,column: column); // 상
//                }
//                if(row > 0 && myGrid[row-1][column] == "1"){
//                    doubleCheck(myGrid2: myGrid2, row: row-1,column: column); // 하
//                }
//                if(column > 0 && myGrid[row][column-1] == "1"){
//                    doubleCheck(myGrid2: myGrid2, row: row,column: column-1); // 좌
//                }
//                if(column < myGrid[0].count - 1 && myGrid[row][column+1] == "1"){
//                    doubleCheck(myGrid2: myGrid2, row: row, column: column+1); //우
//                }
//    }
//}


Solution().numIslands(test)
