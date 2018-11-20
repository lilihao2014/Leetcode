//
//  387. First Unique Character in a String.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/20.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class FirstUniqChar {
    func firstUniqChar(_ s: String) -> Int {
        var alpArray = Array(repeating: 0, count: 26)
        var locationArray = Array(repeating: Int.min, count: 26)
        
        for i in 0..<s.count {
            let c = s[s.index(s.startIndex, offsetBy: i)]
            let utf8C = String(c).utf8
            let value = Int(utf8C[utf8C.startIndex])
            alpArray[value - 97] += 1
            locationArray[value - 97] = i
        }
        
        var res = -1
        for i in 0..<alpArray.count {
            if alpArray[i] == 1 {
                res = res == -1 ? locationArray[i] : min(res, locationArray[i])
            }
        }
        return res
    }
}
