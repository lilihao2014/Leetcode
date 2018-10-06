//
//  84. Largest Rectangle in Histogram.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/5.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class LargestRectangleArea {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var res = 0
        var stack = [Int]()
        for i in 0...heights.count {
            let curr = i == heights.count ? 0 : heights[i]
            while !stack.isEmpty && heights[stack[0]] > curr {
                let height = heights[stack.removeFirst()]
                let width = stack.isEmpty ? i : i - 1 - stack[0]
                res = max(res, height * width)
            }
            stack.insert(i, at: 0)
        }
        return res
    }
}
