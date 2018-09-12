//
//  Laicode Largest Rectangle In Histogram.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/11.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class LargestRectangleInHistogram {
    func largest(array: [Int]) -> Int {
        var res = 0
        var stack = [Int]()
        for i in 0...array.count {
            let curr = i == array.count ? 0 : array[i]
            while !stack.isEmpty && array[stack[0]] > curr {
                let height = array[stack.removeFirst()]
                let left = stack.isEmpty ? 0 : stack[0] + 1
                res = max(res, height * (i - left))
            }
            stack.insert(i, at: 0)
        }
        return res
    }
}
