//https://programmers.co.kr/learn/courses/30/lessons/60058?language=swift
//난이도 레벨2

import Foundation

func solution(_ p:String) -> String {
    var u = ""
    var v = p
    var out = ""
    
    //1. 입력이 빈 문자열인 경우, 빈 문자열을 반환
    if p.isEmpty {
        return ""
    }
    
    //2. 문자열 w를 두 "균형잡힌 괄호 문자열" u, v로 분리
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
    
    //3. 문자열 u가 "올바른 괄호 문자열" 이라면 문자열 v에 대해 1단계부터 다시 수행합니다
    if isCorrect(string: u) {
        out += u
        out += solution(v)
    
    }
    //4. 문자열 u가 "올바른 괄호 문자열"이 아니라면 아래 과정을 수행합니다.
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
