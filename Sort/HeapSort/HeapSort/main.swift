//
//  main.swift
//  HeapSort
//
//  Created by 오킹 on 2021/07/19.
//

import Foundation

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
