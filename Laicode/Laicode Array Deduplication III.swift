//
//  Laicode Array Deduplication III.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/4.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class Dedup3 {
    func dedup3(array: inout [Int]) -> [Int] {
        guard array.count >= 2 else {return array}
        
        var res = [Int]()
        
        var end = 0
        var flag = false
        
        for i in 1..<array.count {
            if array[i] == array[end] {
                flag = true
            }else if flag == true {
                array[end] = array[i]
                flag = false
            }else {
                end += 1
                array[end] = array[i]
                
            }
        }
        
        for i in 0..<end {
            res.append(array[i])
        }
        if flag == false {
            res.append(array[end])
        }
        return res
    }
}
