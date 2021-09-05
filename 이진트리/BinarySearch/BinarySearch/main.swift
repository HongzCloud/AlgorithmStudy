//
//  main.swift
//  BinarySearch
//
//  Created by 오킹 on 2021/09/05.
//

import Foundation

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
         return nums.firstIndex(of: target) ?? -1
    }
}

