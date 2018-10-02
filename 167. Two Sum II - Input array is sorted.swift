//
//  167. Two Sum II - Input array is sorted.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/1.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class TwoSum2 {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        guard numbers.count > 0 else { return [Int]() }
        
        var i = 0, j = numbers.count - 1
        while i < j {
            if numbers[i] + numbers[j] == target {
                return [i + 1, j + 1]
            }else if numbers[i] + numbers[j] < target {
                i += 1
            }else {
                j -= 1
            }
        }
        return [Int]()
    }
}
