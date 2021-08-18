//
//  main.swift
//  ContainerWithMostWater
//
//  Created by 오킹 on 2021/08/18.
// 문제 : https://leetcode.com/problems/container-with-most-water/

import Foundation

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var startPoint = 0
        var endPoint = height.count - 1
        var area = 0
        
        guard endPoint != 1 else {
            return min(height[startPoint], height[endPoint])
        }
        
        while startPoint < endPoint {
            let width = endPoint - startPoint
            var newArea = 0
            
              if height[startPoint] < height[endPoint] {
                newArea = width * height[startPoint]
                startPoint += 1
            } else {
                newArea = width * height[endPoint]
                endPoint -= 1
            }
            
             area = max(area, newArea)
        }
        return area
    }
}

var sol = Solution()
let height = [4,3,2,1,4]
print(sol.maxArea(height)) //16
