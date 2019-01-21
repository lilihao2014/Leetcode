//
//  809. Expressive Words.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2019/1/20.
//  Copyright © 2019 Lihao Li. All rights reserved.
//

import Foundation

class ExpressiveWords {
    
    class RLE {
        var key = ""
        var counts = [Int]()
        
        init(_ s: String) {
            let sArray = Array(s)
            var prev = -1
            
            for i in 0..<sArray.count {
                if i == sArray.count - 1 || sArray[i] != sArray[i + 1] {
                    key.append(sArray[i])
                    counts.append(i - prev)
                    prev = i
                }
            }
        }
    }
    
    func expressiveWords(_ S: String, _ words: [String]) -> Int {
        let r = RLE(S)
        var ans = 0
        
        for word in words {
            let r2 = RLE(word)
            if r.key != r2.key { continue }
            
            var flag = true
            for i in 0..<r.counts.count {
                let c1 = r.counts[i]
                let c2 = r2.counts[i]
                if (c1 < 3 && c1 != c2) || c1 < c2 {
                    flag = false
                    break
                }
            }
            
            if flag {
                ans += 1
            }
        }
        
        return ans
    }
}
