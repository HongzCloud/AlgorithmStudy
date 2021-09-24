//
//  main.swift
//  MenuRenewal
//
//  Created by 오킹 on 2021/09/17.
//

import Foundation


private func solutionP72411(_ orders:[String], _ course:[Int]) -> [String] {
    var menuSet: [String: Int] = [:]
    var result: [String] = []

// 메뉴마다 나올수있는 코스 조합
func combination(origin: [Character], n: Int, resultString: String) {
    if resultString.count > 1 && course.contains(resultString.count) {
        if menuSet.keys.contains(resultString) {
            menuSet[resultString]! += 1
            
        } else { menuSet[resultString] = 1 }
        
    }
    for i in n+1..<origin.count {
        combination(origin: origin, n: i, resultString: "\(resultString)\(origin[i])")
        
    }
}
    // 메뉴순회
    for order in orders {
        let menus: [Character] = order.map { $0 }.sorted()
        print(menus)
        for i in menus.indices {
            combination(origin: menus, n: i, resultString: "\(menus[i])")
            
        }
        
    }
    print(menuSet)
    
    // 가장많은 코스 찾기
    for n in course {
        let max = menuSet.filter { $0.key.count == n && $0.value > 1 }.max { $0.value < $1.value }
        if let max = max { menuSet.filter { $0.key.count == n }.forEach {
            if $0.value == max.value { result.append($0.key) }
        }
        
        }
        
    }
    print(result.sorted())
    return result.sorted()
    
}

print(solutionP72411(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"], [2,3,4]))

