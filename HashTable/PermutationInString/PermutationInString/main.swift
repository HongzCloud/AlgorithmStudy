//
//  main.swift
//  PermutationInString
//
//  Created by 오킹 on 2021/09/06.
//

import Foundation

class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        if s2.count < s1.count { return false }
        let c1 = s1.count, c2 = s2.count, s = Array(s2)
        var dict = s1.reduce(into: [Character: Int](), { $0[$1] = $0[$1, default: 0] - 1 })
        print(dict)
        func updateDict(_ char: Character, _ inc: Int) {
            let v = dict[char, default: 0] + inc
            dict[char] = v == 0 ? nil : v
        }
        for i in 0..<c1 {
            updateDict(s[i], 1)
        }
        print(dict)
        if dict.isEmpty { return true }
        var i = c1
        while i < c2 {
            updateDict(s[i - c1], -1)
            updateDict(s[i], 1)
            i += 1
            if dict.isEmpty { return true }
        }
        return false
    }
}
var sol = Solution()
print(sol.checkInclusion("ab", "eidbaooo"))


//The presenter acts upon the model and the view. It retrieves data from repositories (the model), and formats it for display in the view
//본질적으로는 MVC의 컨트롤러와 같지만, 뷰에 연결되는 것이 아니라 인터페이스로 연결된다는 점이 다릅니다. 이에 따라 MVC가 가진 테스트 가능성 문제와 함께 모듈화/유연성 문제 역시 해결합니다. 프리젠터(Presenter)의 역할을 한줄로 표현한다면 뷰(View)와 모델(Model) 사이에서 자료 전달 역할을 합니다.

//MVP: MVC에서 컨트롤러를 한단계 추상화 한것
class Presenter: PresenterUpdater {
    var model = [1,2,3] {
        didSet {
            updateUI()
        }
    }
    
    var ButtonView
    
    func updateUI() {
        ButtonView.backgroundColor = .blue
    }
}


class ViewController {
    var pressenter: PresenterUpdater?
    
    init(pressenter: PresenterUpdater) {
        self.pressenter = pressenter
    }
}
protocol PresenterUpdater {
    func updateUI()
}
