//
//  Laioffer Edit Distance.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/28.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class EditDistance {
    func editDistance(s1: String, s2: String) -> Int {
        let rows = s1.count + 1
        let columns = s2.count + 1
        
        let s1Array = Array(s1)
        let s2Array = Array(s2)
        
        var distance = Array(repeating: [Int](repeating: 0, count: columns), count: rows)
        
        for i in 0..<rows {
            for j in 0..<columns {
                if i == 0 {
                    distance[i][j] = j
                }else if j == 0 {
                    distance[i][j] = i
                }else if s1Array[i - 1] == s2Array[j - 1] {
                    distance[i][j] = distance[i - 1][j - 1]
                }else {
                    distance[i][j] = min(distance[i - 1][j - 1], min(distance[i - 1][j], distance[i][j - 1])) + 1
                }
            }
        }
        
        return distance[rows - 1][columns - 1]
    }
    
}
