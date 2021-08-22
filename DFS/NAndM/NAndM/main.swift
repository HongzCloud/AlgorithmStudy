//
//  main.swift
//  NAndM
//
//  Created by 오킹 on 2021/08/22.
// 문제 : https://www.acmicpc.net/problem/15649

import Foundation

//DFS: 가능한 모든 경우의 수를 탐색하는 것
//백트래킹: 모든 가능한 경우의 수 중에서 특정한 조건을 만족하는 경우만 살펴보는 것
//답이 될 만한지 판단하고 그렇지 않으면 그 부분까지 탐색하는 것을 하지 않고 가지치기 하는 것
let input = readLine()!.split(separator: " ").map{Int(String($0))}
let n = input[0]!
let m = input[1]!
//1부터 n까지 들어있는 배열을 만든다.
let arr = Array(1...n)
var result = [String](repeating: String(), count: m)
var visited = [Bool](repeating: false, count: n)

//permutation 순열
func solution(depth: Int) {

    //종료조건
    if depth == m {
        print(result.joined(separator: " "))
        return
    }
 
    //m개의 수 뽑기
    for i in 0..<n {
        if visited[i] {
            continue
        } else {
            visited[i] = true
            result[depth] = String(arr[i])
            solution(depth: depth+1)
            visited[i] = false
        }
    }
}

//combination 조합
func solution2(depth: Int) {

    //종료조건
    if depth == m {
        print(result.joined(separator: " "))
        return
    }
 
    //m개의 수 뽑기
    for i in depth..<n {
        if visited[i] {
            continue
        } else {
            visited[i] = true
            result[depth] = String(arr[i])
            solution(depth: depth+1)
            visited[i] = false
        }
    }
}

solution2(depth: 0)
