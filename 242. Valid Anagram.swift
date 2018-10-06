//
//  242. Valid Anagram.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/5.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class IsAnagram {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var dict = [Character: Int]()
        for character in s {
            if let value = dict[character] {
                dict[character] = value + 1
            }else {
                dict[character] = 1
            }
        }
        
        for character in t {
            if let value = dict[character] {
                dict[character] = value - 1
            }else {
                return false
            }
        }
        
        return dict.filter{$1 > 0}.keys.count == 0
    }
}
