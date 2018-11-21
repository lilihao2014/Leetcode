//
//  43. Multiply Strings.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/20.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class Multiply {
    func multiply(_ num1: String, _ num2: String) -> String {
        let count = num1.count + num2.count
        var res = [Int](repeating: 0, count: count)
        let num1Array = Array(num1)
        let num2Array = Array(num2)
        
        for i in (0..<num1Array.count).reversed() {
            for j in (0..<num2Array.count).reversed() {
                res[i + j + 1] += Int(String(num1Array[i]))! * Int(String(num2Array[j]))!
            }
        }
        
        var carry = 0
        for i in (0..<res.count).reversed() {
            let currValue = res[i] + carry
            res[i] = currValue % 10
            carry = currValue / 10
        }
        
        var str = ""
        var firstDigitIsZero = false
        if res[0] == 0 {
            firstDigitIsZero = true
            res[0] = -1
        }else {
            str += String(res[0])
        }
        for i in 1..<res.count {
            if firstDigitIsZero && res[i - 1] == -1 && res[i] == 0 {
                res[i] = -1
                continue
            }
            firstDigitIsZero = false
            str += String(res[i])
        }
        return str.count == 0 ? "0" : str
    }
}
