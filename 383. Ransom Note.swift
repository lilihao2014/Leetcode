//
//  383. Ransom Note.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/8.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class CanConstruct {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        guard magazine.count > 0 else {
            return ransomNote.count == 0
        }
        
        var dict = [Character: Int]()
        for c in magazine {
            if let value = dict[c] {
                dict[c] = value + 1
            }else {
                dict[c] = 1
            }
        }
        
        for c in ransomNote {
            if let value = dict[c] {
                if value == 0 {
                    return false
                }else {
                    dict[c] = value - 1
                }
            }else {
                return false
            }
        }
        return true
    }
}
