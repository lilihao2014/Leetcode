//
//  3. Longest Substring Without Repeating Characters.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/13.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class LengthOfLongestSubstring {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let charArray = Array(s)
        var start = 0, maxLength = 0
        var dict = [Character: Int]()
        for i in 0..<charArray.count {
            let lastSeen = dict[charArray[i]]
            if let lastSeen = lastSeen, lastSeen >= start {
                maxLength = max(maxLength, i - start)
                start = lastSeen + 1
            }
            dict[charArray[i]] = i
        }
        maxLength = max(maxLength, charArray.count - start)
        return maxLength
    }
}
