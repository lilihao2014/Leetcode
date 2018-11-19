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
        var stack = [Int]()
        var sign = 1
        stack.append(1)
        var res = 0
        var i = 0
        while i < s.count {
            let c = s[s.index(s.startIndex, offsetBy: i)]
            if c == " " {
                i += 1
                continue
            }else if c == "+" {
                i += 1
                sign = 1
            }else if c == "-" {
                i += 1
                sign = -1
            }else if c == "(" {
                stack.append((stack.last ?? 1) * sign)
                sign = 1
                i += 1
            }else if c == ")" {
                if !stack.isEmpty {
                    stack.removeLast()
                }
                i += 1
            }else {
                if var tmp = Int(String(c)) {
                    while i + 1 < s.count, let value = Int(String(s[s.index(s.startIndex, offsetBy: i + 1)])) {
                        if tmp * 10 + value > 2147483647 {
                            return 2147483647
                        }
                        tmp = tmp * 10 + value
                        i += 1
                    }
                    res += sign * (stack.last ?? 1) * tmp
                    i += 1
                }
            }
        }
        return res
    }
}
