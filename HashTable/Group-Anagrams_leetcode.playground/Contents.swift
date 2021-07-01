//https://leetcode.com/problems/group-anagrams/

import UIKit

var greeting = "Helloplayground"
var strs = [ "eat", "tea", "tan", "ate", "nat", "bat"]

print(greeting.sorted())

//해쉬맵 + 정렬
func groupAnagrams(_ strs: [String]) -> [[String]] {
    var myStrs = strs
    var result = [String:[String]]()
    var out = [[String]]()
    
    for pointer in strs {
        if result[String(pointer.sorted())] != nil {
            result[String(pointer.sorted())]?.append(pointer)
        } else {
            result[String(pointer.sorted())] = [pointer]
        }
        
    }
    
    for (key,values) in result {
        out.append(values)
    }
    
    return out
}

groupAnagrams(strs)

