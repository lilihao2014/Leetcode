//
//  76. Minimum Window Substring.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2019/1/8.
//  Copyright © 2019 Lihao Li. All rights reserved.
//

import Foundation


class MinWindow {
    func minWindow(_ s: String, _ t: String) -> String {
        if s.count == 0 || t.count == 0 {
            return ""
        }
        
        var dictT = [Character: Int]()
        for c in t {
            dictT[c] = (dictT[c] ?? 0) + 1
        }
        
        let required = dictT.count
        
        var left = 0, right = 0
        var formed = 0
        
        var windowCounts = [Character: Int]()
        var ans = [-1, 0, 0]
        
        while right < s.count {
            var c = s[s.index(s.startIndex, offsetBy: right)]
            windowCounts[c] = (windowCounts[c] ?? 0) + 1
            
            if dictT.keys.contains(c) && windowCounts[c] == dictT[c] {
                formed += 1
            }
            
            while left <= right && formed == required {
                c = s[s.index(s.startIndex, offsetBy: left)]
                if ans[0] == -1 || right - left + 1 < ans[0] {
                    ans[0] = right - left + 1
                    ans[1] = left
                    ans[2] = right
                }
                
                windowCounts[c] = (windowCounts[c] ?? 0) - 1
                if dictT.keys.contains(c) && (windowCounts[c] ?? 0) < (dictT[c] ?? 0) {
                    formed -= 1
                }
                left += 1
            }
            right += 1
        }
        
        return ans[0] == -1 ? "" : String(s[s.index(s.startIndex, offsetBy: ans[1])...s.index(s.startIndex, offsetBy: ans[2])])
    }
}
