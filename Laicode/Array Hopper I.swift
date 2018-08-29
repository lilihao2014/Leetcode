//
//  Array Hopper I.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/28.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class CanJump {
    func canJump(array: [Int]) -> Bool {
        var canJumpArray = [Bool](repeating: false, count: array.count)
        
        for i in stride(from: array.count - 2, to: -1, by: -1) {
            if array[i] + i >= array.count - 1 {
                canJumpArray[i] = true
            }else {
                for j in stride(from: array[i], to: 0, by: -1) {
                    if canJumpArray[j + i] {
                        canJumpArray[i] = true
                        break
                    }
                }
            }
        }
        
        return canJumpArray[0]
    }
}
