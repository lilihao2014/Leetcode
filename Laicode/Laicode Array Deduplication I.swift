//
//  Laicode Array Deduplication I.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/30.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class Dedup {
    func dedup(array: [Int]) -> [Int] {
        guard array.count >= 1 else {
            return array
        }
        var res = [Int]()
        res.append(array[0])
        var end = 0
        for i in 1..<array.count {
            if array[end] != array[i] {
                end = i
                res.append(array[i])
            }
        }
        return res
    }
    
}
