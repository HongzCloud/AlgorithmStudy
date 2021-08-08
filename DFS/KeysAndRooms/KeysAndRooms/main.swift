//
//  main.swift
//  KeysAndRooms
//
//  Created by 오킹 on 2021/08/09.
// 문제 : https://leetcode.com/problems/keys-and-rooms/submissions/

import Foundation

class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        let roomCount = rooms.count
        var queue = rooms[0]
        var visitedRoom = [Bool](repeating:false, count: roomCount)
        visitedRoom[0] = true
        
        while !queue.isEmpty {
            let roomNumber = queue.removeFirst()
            
            if visitedRoom[roomNumber] {
                continue
            } else {
                visitedRoom[roomNumber] = true
                queue += rooms[roomNumber]
            }
        }
        
        if Set(visitedRoom).contains(false) {
            return false
        }
        
        return true
    }
}
