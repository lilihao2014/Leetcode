//
//  13. Roman to Integer.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/16.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class RomanToInt {
    func romanToInt(_ s: String) -> Int {
        var res: Int = 0
        var sArray = Array(s)
        for i in (0..<sArray.count).reversed() {
            let c = sArray[i]
            switch c {
            case "V":
                res += 5
                break
            case "I":
                res += res >= 5 ? -1 : 1
                break
            case "X":
                res += res >= 50 ? -10 : 10
                break
            case "L":
                res += 50
                break
            case "D":
                res += 500
                break
            case "C":
                res += res > 500 ? -100 : 100
                break
            case "M":
                res += 1000
                break
            default:
                break
            }
        }
        return res
    }
}
