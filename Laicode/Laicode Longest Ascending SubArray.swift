//
//  Laicode Longest Ascending SubArray.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/28.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class Longest {
    func longest(array: [Int]) -> Int {
        guard array.count > 0 else {
            return 0
        }
        
        var curr = 1
        var res = 1
        
        for i in 1..<array.count {
            if array[i] > array[i - 1] {
                curr += 1
                res = max(res, curr)
            }else {
                curr = 1
            }
        }
        
        return res
    }
}
