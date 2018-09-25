//
//  412. Fizz Buzz.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/24.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class FizzBuzz {
    func fizzBuzz(_ n: Int) -> [String] {
        var res = [String]()
        for i in 1..<n+1 {
            if i % 15 == 0 {
                res.append("FizzBuzz")
            }else if i % 3 == 0 {
                res.append("Fizz")
            }else if i % 5 == 0 {
                res.append("Buzz")
            }else {
                res.append(String(i))
            }
        }
        return res
    }
}
