import UIKit

//유클리드 호제법 강의: https://www.youtube.com/watch?v=J5Yl2kHPAY4
//GCD(최대공약수) 공식: 유클리드 호제법
//a,b의 최대공약수는 b,r의 최대공약수와 같다.
//b,r 은 또 다른 a,b 이다.
func solution(_ arr:[Int]) -> Int {
    var firstOfArr = arr.first
    var a = arr.first
    
    for index in 1..<arr.count {
        var b = arr[index]
        a = LCM(a: b, b: a!)
    }
    
    return a!
}
func GCD(a: Int, b: Int) -> Int {
    var myA = a
    var myB = b
    while myB != 0 {
        var r = myA % myB
        myA = myB
        myB = r
    }
    return myA
}

//LCM(최소공배수) 공식: a x b / a와 b의 최대공약수
func LCM(a: Int, b: Int) -> Int {

    return a * b / GCD(a: a, b: b)
}
let test = [2,6,8,14]

GCD(a: 10, b: 6)

solution(test)

//배운점
//1.최대공약수 알고리즘, 최소공배수 알고리즘

//궁금한점
//시간복잡도가 로그n이라던데 왜? 예측 어떻게해? 피보나치 수열이랑 비교하던데 왜에?
