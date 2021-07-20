import UIKit

//문제:https://programmers.co.kr/learn/courses/30/lessons/42578

func solution(_ clothes:[[String]]) -> Int {
    var result = 1
    var dic = [String:Int]()
    
    for cloth in clothes {
        if dic[cloth[1]] == nil {
            dic[cloth[1]] = 0
        } else {
            dic[cloth[1]]! += 1
        }
    }
    for (key,val) in dic {
        result *= (val + 1)
    }
    
    result = result - 1
    return result
}
