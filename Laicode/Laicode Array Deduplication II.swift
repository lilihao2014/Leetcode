//
//  Laicode Array Deduplication II.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/4.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class Dedup2 {
    func dedup2(array: [Int]) -> [Int] {
        guard array.count > 2 else {return array}
        
        var res = [Int]()
        res.append(array[0])
        res.append(array[1])
        
        for i in 2..<array.count {
            if array[i] != array[i - 2] {
                res.append(array[i])
            }
        }
        
        return res
    }
}
