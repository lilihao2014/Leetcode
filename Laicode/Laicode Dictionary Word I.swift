//
//  Dictionary Word I.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/28.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class CanBreak {
    func canBreak(input: String, set: Set<String>) -> Bool {
        var canBreakArray = [Bool](repeating: false, count: input.count + 1)
        canBreakArray[0] = true
        for i in 1...input.count {
            for j in 0..<i {
                let startIndex = input.index(input.startIndex, offsetBy: j)
                let endIndex = input.index(input.startIndex, offsetBy: i)
                let range = startIndex..<endIndex
                if set.contains(String(input[range])) && canBreakArray[j] {
                    canBreakArray[i] = true
                    break
                }
            }
        }
        return canBreakArray[canBreakArray.count - 1]
    }
}
