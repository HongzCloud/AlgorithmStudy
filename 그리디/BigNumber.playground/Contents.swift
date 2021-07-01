//https://programmers.co.kr/learn/courses/30/lessons/42883

import UIKit

let number = "1231234"
let k = 3

//그리디에 대해 아무것도 모르고 풀었을 때 풀이법
// 1~9까지 딕셔너리 만들어놓고 각 숫자가 들어있는 갯수를 넣어놓은 후 숫자 큰 순서대로 k수 만큼 뺀다.
func solution(_ number:String, _ k:Int) -> String {
    var numbers: [String:Int] = ["1":0,"2":0,
                   "3":0,"4":0,
                   "5":0,"6":0,
                   "7":0,"8":0,
                   "9":0]
    var out: String = ""
    var check = 0
    
    for element in number {
        numbers[String(element)]! += 1
    }
    print(numbers)
    a: for filledNumber in 1...9 {
        if numbers["\(filledNumber)"]! != 0 {
            
            var results = numbers["\(filledNumber)"]!
            for one in 0..<results {
                numbers["\(filledNumber)"]! -= 1
                check += 1
                if check == k {
                    break a
                }
            }
            print("1")
         
        }
    }
    
    print(numbers)

    for filledNumber in stride(from: 9, to: 0, by: -1) {
        if numbers["\(filledNumber)"]! != 0 {
            print("sibal")
            var results = numbers["\(filledNumber)"]!
            for one in 0..<results {
                numbers["\(filledNumber)"]! -= 1
                out += String(filledNumber)
            }
        }
    }
    print(out)
    return out
}
//solution(number,k)

func solution2(_ number:String, _ k:Int) -> String {
    var map = number.map{String($0)}
    var dic: [String:Int] = ["1":0,"2":0,
                   "3":0,"4":0,
                   "5":0,"6":0,
                   "7":0,"8":0,
                   "9":0]
    var out = [String]()
    
    for element in number {
        dic[String(element)]! += 1
    }
    
    a: for filledNumber in 1...9 {
        if dic["\(filledNumber)"]! != 0 {
            
            var results = dic["\(filledNumber)"]!
            for one in 0..<results {
                dic["\(filledNumber)"]! -= 1

                out.append(String(filledNumber))
                
                if out.count == k {
                    break a
                }
            }
        }
    }
    
    var result = ""
    print(out)
    b: for one in map {
        c: for outOne in out {
           
            if one == outOne {
            
                if let firstIndex = out.firstIndex(of: one) {
                    out.remove(at: firstIndex)
                }
                continue b
            }
        }
      
        result += one
    }
 
    print(map)
    print(result)
    return result
}
solution2(number, k)

