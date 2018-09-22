//
//  91. Decode Ways.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/21.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class NumDecodings {
    func numDecodings(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        let sCharArray = Array(s)
        var prev1 = sCharArray[0] == "0" ? 0 : 1
        var prev2 = 1
        for i in 1..<sCharArray.count {
            var res = 0
            if sCharArray[i] != "0" {
                res += prev1
            }
            if sCharArray[i - 1] == "1" {
                res += prev2
            }else {
                if let num = Int(String(sCharArray[i])) {
                    if num <= 6 && sCharArray[i - 1] == "2" {
                        res += prev2
                    }
                }
            }
            prev2 = prev1
            prev1 = res
        }
        return prev1
    }
}
