import Foundation

let max = Int(1e5) + 1
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let sister = input[1]
var subin = input[0]
var queue = [(subin, 0)]
var time = Int.max
var visited = [Bool](repeating: false, count: max)
var cnt = 0
var index = 0
var dur =
    0
func sol() {
while !queue.isEmpty {
    for i in index..<queue.count {
        let subinInfo = queue[i]

         visited[subinInfo.0] = true
 
        if time == dur - 1 {
            return
        }
        
        if subinInfo.0 == sister {
        time = dur

    
        cnt += 1
      
            continue
        }

        if subinInfo.0 + 1 < max && !visited[subinInfo.0 + 1] {
            queue.append((subinInfo.0 + 1, subinInfo.1 + 1))
        }
        if subinInfo.0 * 2 < max && !visited[subinInfo.0 * 2] {
            queue.append((subinInfo.0 * 2, subinInfo.1 + 1))
        }
        if subinInfo.0 - 1 >= 0 && !visited[subinInfo.0 - 1] {
            queue.append((subinInfo.0 - 1, subinInfo.1 + 1))
        }
        index += 1
    }
    dur += 1
}
}
sol()
print(time, cnt)

//import Foundation
//
//let max = Int(1e5) + 1
//let input = readLine()!.split(separator: " ").map{Int(String($0))!}
//var visited = [Bool](repeating: false, count: max)
//var cnt = 0
//var index = 0
//var dur = 0
//var time = Int.max
//
//func sol(n: Int, k: Int) -> String {
//    var queueArr: [Int] = [n]
//    visited[n] = true
//
//    while !queueArr.isEmpty {
//    for i in index..<queueArr.count {
//        let subinInfo = queueArr[i]
//
//         visited[subinInfo] = true
//
//        if time == dur - 1 {
//            return "\(time)\n\(cnt)"
//        }
//
//        if subinInfo == k {
//            time = dur
//            cnt += 1
//
//        }
//
//        if subinInfo - 1 >= 0 && !visited[subinInfo - 1] {
//            queueArr.append(subinInfo - 1)
//        }
//        if subinInfo + 1 < max && !visited[subinInfo + 1] {
//            queueArr.append(subinInfo + 1)
//        }
//        if subinInfo * 2 < max && !visited[subinInfo * 2] {
//            queueArr.append(subinInfo * 2)
//        }
//
//        index += 1
//
//    }
//    dur += 1
//}
//    return "\(time)\n\(cnt)"
//}
//
//print(sol(n:input.first!,k: input.last!))
//let max = Int(1e5) + 1
//var visit = [Bool](repeating: false, count: max)
//var indx = 0
//var dur = 0
//var cnt = 0
//var fastest = Int.max
//
//func solution(_ n: Int, _ k: Int) -> String {
//    var queue: [Int] = [n]
//    visit[n] = true
//
//    while indx < queue.count {
//        for i in indx..<queue.count {
//            let point = queue[i]
//            visit[point] = true
//
//            if fastest == dur - 1 {
//                return "\(fastest)\n\(cnt)"
//            }
//            if point == k {
//                fastest = dur
//                cnt += 1
//            }
//
//            if 0 <= point - 1 && !visit[point - 1] {
//                queue.append(point - 1)
//            }
//            if point + 1 < max && !visit[point + 1] {
//                queue.append(point + 1)
//            }
//            if point * 2 < max && !visit[point * 2] {
//                queue.append(point * 2)
//            }
//            indx += 1
//        }
//        dur += 1
//    }
//    return "\(fastest)\n\(cnt)"
//}
//
//let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
//print(solution(nk.first!, nk.last!))
