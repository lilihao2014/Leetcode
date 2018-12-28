//
//  224. Basic Calculator.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/24.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class Calculate {
    func calculate(_ s: String) -> Int {
        var res = 0
        var num = 0
        var sign = 1
        var stack = [Int]()
        let sArray = Array(s)
        
        for i in 0..<sArray.count {
            if let currentNumber = Int(String(sArray[i])) {
                num = num * 10 + currentNumber
            }else if sArray[i] == "+" || sArray[i] == "-" {
                res = res + num * sign
                sign = sArray[i] == "+" ? 1 : -1
                num = 0
            }else if sArray[i] == "(" {
                stack.append(res)
                stack.append(sign)
                sign = 1
                res = 0
            }else if sArray[i] == ")" {
                res += sign * num
                let tmp = stack.removeLast() * res
                res = tmp + stack.removeLast()
                sign = 1
                num = 0
            }
        }
        
        return num == 0 ? res : res + sign * num
    }
}
