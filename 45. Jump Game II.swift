//
//  45. Jump Game II.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/28.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class Jump {
    func jump(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        
        var minJump = [Int](repeating: -1, count: nums.count)
        minJump[0] = 0
        
        for i in stride(from: 1, to: nums.count, by: 1) {
            for j in stride(from: 0, to: i, by: 1) {
                if nums[j] + j >= i && minJump[j] != -1 {
                    minJump[i] = minJump[j] + 1
                    break
                }
            }
        }
        
        return minJump[minJump.count - 1]
    }
}
