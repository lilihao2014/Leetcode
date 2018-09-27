//
//  128. Longest Consecutive Sequence.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/26.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class LongestConsecutive {
    func longestConsecutive1(_ nums: [Int]) -> Int {
        var set = Set<Int>()
        for num in nums {
            set.insert(num)
        }
        
        var longestStreak = 0
        for num in nums {
            if !set.contains(num - 1) {
                var currentStreak = 1
                var currentNum = num
                while set.contains(currentNum + 1) {
                    currentStreak += 1
                    currentNum += 1
                }
                longestStreak = max(longestStreak, currentStreak)
            }
        }
        
        return longestStreak
    }
    
    
    func longestConsecutive2(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var nums = nums.sorted(){$0 < $1}
        var longestStreak = 0
        var currentStreak = 1
        for i in 1..<nums.count {
            if nums[i] != nums[i - 1] {
                if nums[i - 1] + 1 == nums[i] {
                    currentStreak += 1
                }else {
                    longestStreak = max(longestStreak, currentStreak)
                    currentStreak = 1
                }
            }
        }
        return max(longestStreak, currentStreak)
    }
}
