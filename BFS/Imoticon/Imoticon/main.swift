//
//  main.swift
//  Imoticon
//
//  Created by 오킹 on 2021/09/02.
//
var input = Int(readLine()!)!
var clipBoard = 0
var queue = [(1,0)] // (이모티콘 수, 클립보드)
var index = 0
var visited = Array(repeating: Array(repeating: false, count: 1001), count: 1001)
var dur = 0
var time = 0

func sol() {
    while !queue.isEmpty {
        for i in index..<queue.count {
            let currentNode = queue[i]

            if currentNode.0 == input {
                time = dur
                return
            }

            //복사
            if !visited[currentNode.0][currentNode.0] {
                visited[currentNode.0][currentNode.0] = true
                queue.append((currentNode.0, currentNode.0))
            }

            //붙여넣기
            if currentNode.1 > 0 && currentNode.0 + currentNode.1 < 1001 && !visited[currentNode.0 + currentNode.1][currentNode.1] {
                visited[currentNode.0+currentNode.1][currentNode.1] = true
                queue.append((currentNode.0+currentNode.1, currentNode.1))
            }

            //삭제
            if currentNode.0 - 1 > 0 && !visited[currentNode.0 - 1][currentNode.1] {
                visited[currentNode.0 - 1][currentNode.1] = true
                queue.append((currentNode.0 - 1, currentNode.1 ))
            }

            index += 1
        }
        dur += 1
    }
}

sol()
print(time)

