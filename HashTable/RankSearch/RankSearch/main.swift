//
//  main.swift
//  RankSearch
//
//  Created by 오킹 on 2021/09/24.
//

import Foundation

//1.완전탐색 -> 50억번 시간초과
func solution(_ info:[String], _ query:[String]) -> [Int] {
     var result = Array(repeating: 0, count: query.count)
    
     for oneInfo in info {
         for queryIndex in 0..<query.count {
             if isSuitable(info: oneInfo, condition: query[queryIndex]) {
                 result[queryIndex] += 1
             }
         }
     }
     return result
    
}

 func isSuitable(info: String, condition: String) -> Bool {
     let splitedInfo = info.components(separatedBy: " ")
    var splitedCondition = condition.components(separatedBy: " and ")
    let foodAndScore = splitedCondition.removeLast().components(separatedBy: " ")
    splitedCondition.append(contentsOf: foodAndScore)

     for i in 0..<splitedInfo.count-1 {
         if splitedCondition[i] == "-" { continue }
         if splitedInfo[i] != splitedCondition[i] { return false }
     }
    
     return Int(splitedInfo.last!)! >= Int(splitedCondition.last!)! ? true : false
    
}

//해쉬 + 이진탐색
func sol2(_ info:[String], _ query:[String]) -> [Int] {
    var dic = [String:[Int]]()
    var result = [Int]()
    dic["all"] = [Int]()
    
    for oneInfo in info {
        var splitedInfo = oneInfo.components(separatedBy: " ")
        let score = Int(splitedInfo.removeLast())!
        var allGroup = splitedInfo.combinationsWithoutRepetitionRemoved
        
        for group in allGroup {
            let groupKey = group.joined()
            if dic[groupKey] == nil {
                dic[groupKey] = [score]
            } else {
                dic[groupKey]!.append(score)
            }
        }
        
        dic["all"]!.append(score)
    }
    
    for condition in query {
        var splitedCondition = condition.components(separatedBy: " and ")
        let foodAndScore = splitedCondition.removeLast().components(separatedBy: " ")
        splitedCondition.append(foodAndScore[0])
        let group = splitedCondition.joined().components(separatedBy: "-").joined()
        
        if group == "" {
            result.append(dic["all"]!.count - lowerBound(arr: dic["all"]!.sorted(), start: 0, end: dic["all"]!.count, target: Int(foodAndScore[1])!))
            continue
        }
        if dic[group] == nil {
            result.append(0)
            continue
        } else {
            result.append(dic[group]!.count - lowerBound(arr: dic[group]!.sorted(), start: 0, end: dic[group]!.count, target: Int(foodAndScore[1])!))
        }
 
    }
    
    return result
}

func lowerBound(arr: [Int], start: Int, end: Int, target: Int) -> Int {
    var start = start
    var end = end
    
    while start < end {
        let mid = (start + end) / 2
        if arr[mid] < target {
            start = mid + 1
        } else {
            end = mid
        }
    }
    
    return end
}


extension Array {
    var combinationsWithoutRepetition: [[Element]] {
        guard !isEmpty else { return [[]] }
        return Array(self[1...]).combinationsWithoutRepetition.flatMap { [$0, [self[0]] + $0] }
    }
    
    var combinationsWithoutRepetitionRemoved: [[Element]] {
        var result = self.combinationsWithoutRepetition
        result.removeFirst()
        return result
    }
}

sol2(["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"], ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"])

