//
//  Laicode Longest Common Substring .swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/11.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class LongestCommon {
    func longestCommon(s: String, t: String) -> String {
        let sArray = Array(s)
        let tArray = Array(t)
        
        var start = 0, longest = 0
        
        var res = Array(repeating: Array(repeating: 0, count: tArray.count), count: sArray.count)
        for i in 0..<sArray.count {
            for j in 0..<tArray.count {
                if sArray[i] == tArray[j] {
                    if i == 0 || j == 0 {
                        res[i][j] = 1
                    }else {
                        res[i][j] = res[i - 1][j - 1] + 1
                    }
                    
                    if res[i][j] > longest {
                        longest = res[i][j]
                        start = i - longest + 1
                    }
                }
            }
        }
        
        var commonString = String()
        for i in start..<start + longest {
            commonString += String(sArray[i])
        }
        
        return commonString
    }
}
