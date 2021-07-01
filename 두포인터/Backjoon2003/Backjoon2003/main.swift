//
//  main.swift
//  Backjoon2003
//
//  Created by 오킹 on 2021/06/14.
//https://www.acmicpc.net/problem/2003

import Foundation

// [N, M]
var inputs = [10, 5]
// 입력배열
var list = [1, 2, 3, 4, 2, 5, 3, 1, 1, 2]

var left = 0
var right = 0
var sum = list[0]
var result = 0

while left < list.count && right < list.count {
    //합이 m 보다 작을 때
    if sum > inputs[1] {
        sum -= list[left]
        left += 1
        continue
    }
    //합이 m이랑 같을 때
    if sum == inputs[1] { result += 1 }
    right += 1

    if right < list.count { sum += list[right] }
}

print(result)


print(result, "dd")
print("ddddddsasd")
