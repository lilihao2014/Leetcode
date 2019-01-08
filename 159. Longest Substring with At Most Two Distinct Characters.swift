//
//  159. Longest Substring with At Most Two Distinct Characters.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2019/1/8.
//  Copyright © 2019 Lihao Li. All rights reserved.
//

import Foundation

class LengthOfLongestSubstringTwoDistinct {
    func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int {
        var left = 0, right = 0
        var maxLength = 0
        var window = [Character: Int]()
        let sArray = Array(s)
        
        while right < sArray.count {
            let curr = sArray[right]
            window[curr] = (window[curr] ?? 0) + 1
            while window.count > 2 {
                let prev = sArray[left]
                left += 1
                window[prev] = ((window[prev] ?? 0) - 1 == 0) ? nil : (window[prev] ?? 0) - 1
            }
            maxLength = max(maxLength, right - left + 1)
            right += 1
        }
        return maxLength
    }
}
