//
//  161. One Edit Distance.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/2.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class IsOneEditDistance {
    func isOneEditDistance(_ s: String, _ t: String) -> Bool {
        var i = 0, j = 0
        var diff = 0
        let sArray = Array(s)
        let tArray = Array(t)
        while i < sArray.count && j < tArray.count {
            if sArray[i] != tArray[j] {
                if sArray.count < tArray.count {
                    i -= 1
                }else if sArray.count > tArray.count {
                    j -= 1
                }
                diff += 1
            }
            i += 1
            j += 1
        }
        
        while i < sArray.count {
            i += 1
            diff += 1
        }
        
        while j < tArray.count {
            j += 1
            diff += 1
        }
        
        return diff == 1
    }
}
