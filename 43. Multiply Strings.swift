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
        var numArray = Array(repeating: 0, count: num1.count + num2.count)
        let num1Array = Array(num1)
        let num2Array = Array(num2)
        
        for i in (0..<num1Array.count).reversed() {
            for j in (0..<num2Array.count).reversed() {
                numArray[i + j + 1] += Int(String(num1Array[i]))! * Int(String(num2Array[j]))!
            }
        }
        
        var carry = 0
        for i in (0..<numArray.count).reversed() {
            let sum = numArray[i] + carry
            numArray[i] = sum % 10
            carry = sum / 10
        }
        
        var res = ""
        var firstIsZero = false
        if numArray[0] == 0 {
            firstIsZero = true
        }else {
            res.append(String(numArray[0]))
        }
        
        for i in 1..<numArray.count {
            if firstIsZero && numArray[i] == 0 {
                continue
            }
            
            firstIsZero = false
            res.append(String(numArray[i]))
        }
        return res.count == 0 ? "0" : res
    }
}
