//
//  72. Edit Distance.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/9.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

class MinDistance {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let rows = word1.count + 1
        let columns = word2.count + 1
        var res = Array(repeating: Array(repeating: 0, count: columns), count: rows)
        for i in 0..<rows {
            res[i][0] = i
        }
        for i in 0..<columns {
            res[0][i] = i
        }
        
        let word1CharArray = Array(word1)
        let word2CharArray = Array(word2)
        
        for i in 1..<rows {
            for j in 1..<columns {
                if word1CharArray[i - 1] == word2CharArray[j - 1] {
                    res[i][j] = res[i - 1][j - 1]
                }else {
                    res[i][j] = min(res[i - 1][j - 1], min(res[i - 1][j], res[i][j - 1])) + 1
                }
            }
        }
        return res[rows - 1][columns - 1]
    }
}

