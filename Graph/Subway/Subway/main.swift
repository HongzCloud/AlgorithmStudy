//
//  main.swift
//  Subway
//
//  Created by 오킹 on 2021/08/15.
//

import Foundation

var subwayIntArray = [[Int]]()
var endNumber = 0

func solution(_ subway:[String], _ start:Int, _ end:Int) -> Int {
    subwayIntArray = stringToIntArray(str: subway)
    endNumber = end
    let startLines = searchStation(input: subwayIntArray, node: start)
    let endLines = searchStation(input: subwayIntArray, node: end)

    return  searchMinTransferStation(arr2: searchTransferStation(input: subwayIntArray), start: startLines, end: endLines)
}

//String to Int Array
func stringToIntArray(str: [String]) -> [[Int]] {
    var out = str.map{$0.split(separator: " ").map{Int($0)!}}
    return out
}

//1.시작점과 끝점이 어느 호선에 있는지 알아야함
func searchStation(input: [[Int]], node: Int) -> [Int] {
    var out = [Int]()
    
    for row in 0..<input.count {
        for column in 0..<input[row].count {
            if node == input[row][column] {
                out.append(row)
            }
        }
    }
    return out
}

//2.몇호선과 몇호선이 연결되어있는지 알아야함 [[1,3],[2,],[],[],[]]
func searchTransferStation(input: [[Int]]) -> [[Int]] {
    var index = 0
    var rows = input.count
    var out = [[Int]](repeating: [Int](), count:rows)
    
    for row in 0..<rows {
        for column in 0..<input[row].count {
            for line in row..<rows {
                if row != line {
                    if input[line].contains(input[row][column]) {
                        out[row].append(line)
                    }
                }
                
            }
        }
    }
    print("연결되어있는 호선: ", out)
    return out
}

//3.시작점과 끝점에 도달하는 모든 경로 탐색 [0]
func searchMinTransferStation(arr2: [[Int]], start: [Int], end: [Int]) -> Int {
    var queue = [Int]()
    var result = [Int]()
    var resultNumber = 0
    var index = 0

    for element in start {
        queue += arr2[element]
    }
    print(queue)
    for startIndex in start {
        if subwayIntArray[startIndex].contains(endNumber) {
            return 0
        }
    }
    
    while !queue.isEmpty {
        resultNumber += 1
         
        for endElement in end {
            if queue.contains(endElement) {
                return resultNumber
            }
        }

        var queueCount = queue.count

        for i in 0..<queueCount {
            queue += arr2[queue.removeFirst()]
        }
    }

    return resultNumber
}


print(solution(["1 2 3 4 5 6 7 8","2 11","0 11 10","3 17 19 12 13 9 14 15 10","20 2 21"], 1, 9)) //1
print(solution(["1 2","2 3","3 4"], 1, 4)) //2
print(solution(["1 2 3 4 5 6 7 8 9 10","2 8"], 1, 10)) //0
print(solution(["0 1 2 3 4","1 12 13 14"], 2, 12)) //1
