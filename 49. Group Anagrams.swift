//
//  49. Group Anagrams.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/21.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class GroupAnagrams {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var res = [[String]]()
        var dict = [String: [String]]()
        strs.forEach{(string) in
            let charArray = Array(string).sorted(){$0 < $1}
            let key = String(charArray)
            if dict[key] != nil {
                dict[key]?.append(string)
            }else {
                dict[key] = [string]
            }
        }
        for key in dict.keys {
            res.append(dict[key]!)
        }
        return res
    }
}
