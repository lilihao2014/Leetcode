//
//  Laicode Array Hopper II.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/28.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class MinJump {
    func minJump(array: [Int]) -> Int {
        guard array.count > 0 else {
            return 0
        }
        var minJump = [Int](repeating: -1, count: array.count)
        minJump[0] = 0
        for i in stride(from: 1, to: array.count, by: 1) {
            for j in stride(from: i - 1, to: -1, by: -1) {
                if array[j] + j >= i && minJump[j] != -1 {
                    minJump[i] = minJump[j] + 1
                }
            }
        }
        return minJump[minJump.count - 1]
    }
}
