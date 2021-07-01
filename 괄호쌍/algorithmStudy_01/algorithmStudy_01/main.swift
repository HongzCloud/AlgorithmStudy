//
//  main.swift
//  algorithmStudy_01
//
//  Created by 오킹 on 2021/05/27.
//

import Foundation

print("Hello, World!")

var input1 = "(()())()"
var input2 = ")("
var input3 = "()))((()"

func solution(_ p:String) -> String {
    var u = ""
    var v = p
    var out = ""
    
    //1. 입력이 빈 문자열인 경우, 빈 문자열을 반환합니다.
    if p.isEmpty {
        return ""
    }
    
    //2. 문자열 w를 두 "균형잡힌 괄호 문자열" u, v로 분리합니다. 단, u는 "균형잡힌 괄호 문자열"로 더 이상 분리할 수 없어야 하며, v는 빈 문자열이 될 수 있습니다.
    func divideString(string: String) {
        let open = 1
        let close = -1
        var result = 0
        
        for one in string {
            if one == "(" {
                result += open
                u += String(v.removeFirst())
            }
            else {
                result += close
                u += String(v.removeFirst())
            }
            
            if result == 0 {
                break
            }
        }
    }
    
    func convert(u: String) -> String {
        var out = ""
        
        for one in u {
            out += one == "(" ? ")":"("
        }
        
        return out
    }
    
    func isCorrect(string: String) -> Bool {
        string.first == "(" ? true : false
    }
    
    divideString(string: v)
    
    if isCorrect(string: u) {
        out += u
        out += solution(v)
    
    }
    else {
        var emptyString = "("
        emptyString += solution(v)
        emptyString += ")"
        u.removeFirst()
        u.removeLast()
        out += emptyString
        out += convert(u: u)
    }
    
    return out
}

print(solution(input3))
