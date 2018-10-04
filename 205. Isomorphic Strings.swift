//
//  205. Isomorphic Strings.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/3.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class IsIsomorphic {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        
        var dict = [Character: Character]()
        let sArray = Array(s)
        let tArray = Array(t)
        
        for i in 0..<s.count {
            if let sValue = dict[sArray[i]] {
                if sValue != tArray[i] {
                    return false
                }
            }else {
                let sameKeysArray = dict.filter(){$1 == tArray[i]}
                if sameKeysArray.count > 0 { return false }
                dict[sArray[i]] = tArray[i]
            }
        }
        
        return true
    }
}
