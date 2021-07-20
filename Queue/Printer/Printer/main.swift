//
//  main.swift
//  Printer
//
//  Created by 오킹 on 2021/07/07.
// https://programmers.co.kr/learn/courses/30/lessons/42587

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var myPrioritiy = priorities
    var nowIndex = location
    var answer = 0
    
    while true {
        if myPrioritiy.first == myPrioritiy.max() {
            myPrioritiy.removeFirst()
            answer += 1
            
            if nowIndex == 0 {
                break
            } else {
                nowIndex -= 1
            }
        } else {
            myPrioritiy.append(myPrioritiy.removeFirst())
            
            if nowIndex == 0 {
                nowIndex = myPrioritiy.count - 1
            } else {
                nowIndex -= 1
            }
        }
    }
    
    return answer
}
var test1 = [2, 1,3, 2]
var location = 3
let result = 1

print(solution(test1, location))
func solution2(_ priorities:[Int], _ location:Int) -> Int {
    var priority = priorities
    var currentLocation = location
    var answer = 0
    
    while true {
        if priority.first == priorities.max() {
            answer += 1
            
            if currentLocation == 0 {
                break
            } else {
                currentLocation -= 1
            }
        } else {
            priority.append(priority.removeFirst())
            
            if currentLocation == 0 {
                currentLocation = priorities.count - 1
            } else {
                currentLocation -= 1
            }
        }
    }
    return answer
}

private func getUsers() {
    let session = URLSession.shared
    guard let requestURL = URL(string: "") else {return}
    session.dataTask(with: requestURL) { data, response, error in
        guard error == nil else {
            print(error?.localizedDescription)
            return
        }
        
        if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
            do {
                let userResponse = try JSONDecoder().decode(UserResponse.self, from: data)
                
            var a = userResponse
                DispatchQueue.main.async {
//                    tableView.reloadData()
                }
            } catch(let err) {
                print("Decoding Error")
                print(err.localizedDescription)
            }
        }
    }.resume()

}

class UserResponse: Codable {
}

func get() {
    let session = URLSession.shared
    guard let requestURL = URL(string: "") else { return }
    session.dataTask(with: requestURL) { data, response, error in
        guard error == nil else {
            print("error")
            return
        }
        
        if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
            do {
                let userResponse = try JSONDecoder().decode(UserResponse.self, from: data)
            } catch(let err) {
                print(err.localizedDescription)
            }
        }
    }
}

func go(completion: ) {
    
}
