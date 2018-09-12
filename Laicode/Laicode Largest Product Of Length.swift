//
//  Laicode Largest Product Of Length.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/11.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class LargestProduct {
    func largestProduct(dict: [String]) -> Int {
        let dictCopy = dict.sorted(){$0.count > $1.count}
        
        var res = 0
        for i in 1..<dictCopy.count {
            for j in 0..<i {
                if !containsDuplicate(s: dictCopy[i], t: dictCopy[j]) {
                    if dictCopy[i].count * dictCopy[j].count > res {
                        res = dictCopy[i].count * dictCopy[j].count
                        break
                    }
                }
            }
        }
        return res
    }
    
    
    private func containsDuplicate(s: String, t: String) -> Bool {
        let sArray = Array(s)
        let tArray = Array(t)
        
        var set = Set<Character>()
        
        sArray.forEach { (c) in
            set.insert(c)
        }
        
        var flag = false
        for c in tArray {
            if set.contains(c) {
                flag = true
                break
            }
        }
        
        return flag
    }
}
