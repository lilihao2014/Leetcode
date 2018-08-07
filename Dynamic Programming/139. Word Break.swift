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
        var isContained = Array(repeating: false, count: s.count)
        let charArray = Array(s)
        for i in 0..<charArray.count {
            for j in 0...i {
                var tmp = String()
                for index in j...i {
                    tmp += String(charArray[index])
                }
                if (j == 0 || isContained[j - 1]) && wordDict.contains(tmp) {
                    isContained[i] = true
                    break
                }
            }
        }
        return isContained[isContained.count - 1]
    }
}
