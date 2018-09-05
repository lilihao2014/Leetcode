//
//  Laicode Common Elements In Three Sorted Array.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/4.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class Common {
    func common(aArray: [Int], bArray: [Int], cArray: [Int]) -> [Int] {
        var res = [Int]()
        var ai = 0, bi = 0, ci = 0
        while ai < aArray.count && bi < bArray.count && ci < cArray.count {
            if aArray[ai] == bArray[bi] && bArray[bi] == cArray[ci] {
                res.append(aArray[ai])
                ai += 1
                bi += 1
                ci += 1
            }else if aArray[ai] <= bArray[bi] && aArray[ai] <= cArray[ci] {
                ai += 1
            }else if  bArray[bi] <= aArray[ai] && bArray[bi] <= cArray[ci] {
                bi += 1
            }else {
                ci += 1
            }
        }
        return res
    }
}
