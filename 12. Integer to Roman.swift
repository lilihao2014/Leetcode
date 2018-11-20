//
//  12. Integer to Roman.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/20.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class IntToRoman {
    func intToRoman(_ num: Int) -> String {
        var res = ""
        var num = num
        while num > 0 {
            if num >= 1000 {
                res += "M"
                num -= 1000
            }else if num >= 900 {
                res += "CM"
                num -= 900
            }else if num >= 500 {
                res += "D"
                num -= 500
            }else if num >= 400 {
                res += "CD"
                num -= 400
            }else if num >= 100 {
                res += "C"
                num -= 100
            }else if num >= 90 {
                res += "XC"
                num -= 90
            }else if num >= 50 {
                res += "L"
                num -= 50
            }else if num >= 40 {
                res += "XL"
                num -= 40
            }else if num >= 10 {
                res += "X"
                num -= 10
            }else if num >= 9 {
                res += "IX"
                num -= 9
            }else if num >= 5 {
                res += "V"
                num -= 5
            }else if num >= 4 {
                res += "IV"
                num -= 4
            }else if num >= 1 {
                res += "I"
                num -= 1
            }
        }
        return res
    }
}
