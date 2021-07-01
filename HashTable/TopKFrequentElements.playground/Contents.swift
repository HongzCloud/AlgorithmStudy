//https://leetcode.com/problems/top-k-frequent-elements/

import UIKit

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var myNums = nums.sorted()
        var myK = k
        var dic = [Int:Int]()
        
        for num in myNums {
            if dic[num] != nil {
                dic[num]! += 1
            } else {
                dic[num] = 1
            }
        }
        
        var keys = [Int]()
        var values = [Int]()
        
        for (key, value) in dic {
            keys.append(key)
            values.append(value)
        }
        
        var result = [Int]()
        
        while myK > 0 {
            print(myK)
            myK -= 1
            
            if let firstIndex = values.firstIndex(of: values.max() ?? 0) {
  
                result.append(keys[firstIndex])
                values.remove(at: firstIndex)
                keys.remove(at: firstIndex)
            }
        }
        return result
    }
}

var input = [1,1,1,2,2,3]
var k = 2
//Output: [1,2]
print(Solution().topKFrequent(input, k))
