//
//  main.swift
//  Carpet
//
//  Created by 오킹 on 2021/07/22.
// 문제 : https://programmers.co.kr/learn/courses/30/lessons/42842

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var measures = [Int]()
    let sum = brown + yellow
    let midIndex = measures.count / 2
    
    //sum의 모든 약수 뽑아내기
    for measure in 1...sum {
        if sum % measure == 0 {
            measures.append(measure)
        }
    }

    if measures.count % 2 == 0 {
        var index = 0
        while true {
            //노란색 갯수 확인하기
            let yellowCount = (measures[midIndex + index] - 2) * (measures[midIndex - 1 - index] - 2)
            
            if yellow == yellowCount {
                return [measures[midIndex + index], measures[midIndex - 1 - index]]
            } else {
                index += 1
            }
        }
    } else {
        return [measures[midIndex], measures[midIndex]]
    }
    
    return []
}
