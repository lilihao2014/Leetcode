//
//  66. Plus One.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/9.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class PlusOne {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digitsCopy = digits
        for i in (0...digitsCopy.count-1).reversed() {
            if digitsCopy[i] + 1 < 10 {
                digitsCopy[i] += 1
                return digitsCopy
            }else {
                digitsCopy[i] = 0
            }
        }
        digitsCopy.insert(1, at: 0)
        return digitsCopy
    }
}
