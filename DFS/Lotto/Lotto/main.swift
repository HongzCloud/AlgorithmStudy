//
//  main.swift
//  Lotto
//
//  Created by 오킹 on 2021/08/19.
//  문제 : https://www.acmicpc.net/problem/6603

import Foundation

func input() -> [Int] {
    return readLine()!.split(separator: " ").map{Int(String($0))!}
}

var k = 0
var numbers = [Int]()
var combi = [Int](repeating: 0, count: 6)

func startLotto() {
    
    while true {
     numbers = input()
    
    if numbers[0] == 0 {
        return
    }

    k = numbers.removeFirst()
    
    dfs(0, 0)
    print()
    }
}


func dfs(_ start: Int,_ depth: Int) {
  
    //탈출조건
    if depth == 6 {
        for element in 0..<6 {
            print(combi[element], terminator: " ")
        }
        print()
        return
    }
       
    for i in start..<k {
        print(combi)
        combi[depth] = numbers[i];
        dfs(i+1, depth+1);
    }
}

startLotto()
