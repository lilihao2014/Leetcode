//
//  139. Word Break.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/7.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class WordBreak {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var canBreak = Array(repeating: false, count: s.count)
        for i in 0..<s.count {
            for j in 0...i {
                if (j == 0 || canBreak[j - 1]) && wordDict.contains(String(s[s.index(s.startIndex, offsetBy: j)...s.index(s.startIndex, offsetBy: i)])) {
                    canBreak[i] = true
                    break
                }
            }
        }
        return canBreak[canBreak.count - 1]
    }
}
