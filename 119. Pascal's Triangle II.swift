//
//  119. Pascal's Triangle II.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/5.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class GetRow {
    func getRow(_ rowIndex: Int) -> [Int] {
        if rowIndex == 0 {
            return [1]
        }
        var prev = [1, 1]
        var currIndex = 2
        while currIndex <= rowIndex {
            var curr = [Int]()
            curr.append(1)
            for j in 1..<currIndex {
                curr.append(prev[j - 1] + prev[j])
            }
            curr.append(1)
            prev = curr
            currIndex += 1
        }
        return prev
    }
}
