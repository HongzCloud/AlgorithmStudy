//
//  main.swift
//  TruckCrossingTheBridge
//
//  Created by 오킹 on 2021/07/15.
// 문제 :

import Foundation

//func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
//    var myTruckWeights = truck_weights
//    var time = 1
//    var terminal = [(Int, Int)]()
//    terminal.append((myTruckWeights.removeFirst(),0))
//
//    while true {
//        if let truck = myTruckWeights.first {
//            var test = terminal.reduce((0,0)) {($0.0 + $1.0, 0)}
//            if truck + test.0 > weight {
//
//                print(terminal)
//
//            } else {
//                terminal.append((myTruckWeights.removeFirst(),0))
//            }
//        }
//        time += 1
//        terminal = terminal.map{($0.0, $0.1 + 1)}
//        terminal = terminal.filter{$0.1 < bridge_length}
//        if terminal.isEmpty &&  myTruckWeights.isEmpty {
//            print(terminal)
//
//            time += 1
//            print(time)
//            break
//        }
//    }
//
//    return time
//}
//
////solution(2, 10, [7,4,5,6])
//solution(100, 100,    [10, 10, 10, 10, 10, 10, 10, 10, 10, 10])

//
struct Heap {
    var heap = [Int]()

    init(data: Int) {
        heap.append(data)       // 실제 Root Node 채우기
    }

    mutating func insert(_ data: Int) {

        heap.append(data)

        func isMoveUp(_ insertIndex: Int) -> Bool {
            if insertIndex <= 1 {               // 루트 노드일 때
                return false
            }
            let parentIndex: Int = insertIndex / 2
            return heap[insertIndex] > heap[parentIndex] ? true : false
        }

        var insertIndex: Int = heap.count - 1
        while isMoveUp(insertIndex) {
            let parentIndex: Int = insertIndex / 2
            heap.swapAt(insertIndex, parentIndex)
            insertIndex = parentIndex
        }
    }
}
var heap = Heap( data: 10)  // 0번 index 채우기용
heap.insert(100)
heap.insert(30)
heap.insert(30)
heap.insert(50)

print(heap.heap)

//
//var a = "dd"
//
//func tt(_ aaa: inout String) {
//    print(aaa)
//}
//print(tt(&a))
//a += "ff"
//print(tt(&a))
//
//func a(p3: inout String) { withUnsafePointer(to: &p3) { print($0)  } }
//
//var p3 = "aacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaacccaaccc"
//var p2 = "aaccc"
//let dd = "dd"
//func test(of object: UnsafeRawPointer) -> String {
//    let addr = Int(bitPattern: object)
//    return String(format: "%p", addr)
//        }
//var tttt = [1,2,3]
//print(test(of: tttt))
//tttt.append(4)
//print(test(of: tttt))
//
func solution(_ citations:[Int]) -> Int {
    var sorted = citations.sorted(by: >)
    
    for index in 0..<citations.count {
        if (sorted[index] <= index) {
          return index
        }
    }

    return sorted.count
}

print(solution([3,0,6,1,5])) // 3
print(solution([1545, 2, 999, 790, 540, 10, 22])) // 6
print(solution([6,6,6,6,6,6])) // 6

