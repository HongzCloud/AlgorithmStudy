import UIKit

//문제 : https://leetcode.com/problems/n-repeated-element-in-size-2n-array/
class Solution {
    func repeatedNTimes(_ nums: [Int]) -> Int {
        var dic = [Int:Int]()
        
        for num in nums {
            if dic[num] == nil {
                dic[num] = 0
            } else {
                return num
            }
        }
        
        return 0
    }
}
