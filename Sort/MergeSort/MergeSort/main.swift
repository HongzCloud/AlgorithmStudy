//
//  main.swift
//  MergeSort
//
//  Created by 오킹 on 2021/07/19.
// 참고 : 아이작 코드로 공부했다. v 재귀함수 동작에 대해 공부할 필요성을 느꼇다.

import Foundation

//이때 l과 r은 정렬이 된 상태여야 한다.
func merged(l: [Int], r: [Int]) -> [Int] {
    var currentLeftIndex = 0
    var currentRightIndex = 0
    var sorted = [Int]()
    
    //왼쪽 오른쪽 배열을 비교해서 큰 숫자 차례로 담음
    while currentLeftIndex < l.count && currentRightIndex < r.count {
        if l[currentLeftIndex] > r[currentRightIndex] {
            sorted.append(l[currentLeftIndex])
            currentLeftIndex += 1
        } else {
            sorted.append(r[currentRightIndex])
            currentRightIndex += 1
        }
    }
    
    //아직 끝나지 않은 배열을 뒤에 붙임
    if currentLeftIndex < l.count {
        sorted.append(contentsOf: l[currentLeftIndex...])
    }
    if currentRightIndex < r.count {
        sorted.append(contentsOf: r[currentRightIndex...])
    }
    
    return sorted
}

func mergeSort(arr: [Int]) -> [Int] {
    if arr.count <= 1 {
        return arr
    }
    let mid = arr.count / 2
    let leftArr = Array(arr[0..<mid])
    let rightArr = Array(arr[mid..<arr.count])
    //1개 남을때 까지 계속 재귀적으로 반으로 쪼갬
    let sortedLeftArr = mergeSort(arr: leftArr)
    let sortedRightArr = mergeSort(arr: rightArr)
    return merged(l: sortedLeftArr, r: sortedRightArr)
}

print(mergeSort(arr: [3, 1, 2, 4, 1, 5, 3, 2]))
