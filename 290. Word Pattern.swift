//
//  290. Word Pattern.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/5.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class WordPattern {
    func wordPattern(_ pattern: String, _ str: String) -> Bool {
        let pArray = Array(pattern)
        let strArray = str.components(separatedBy: " ")
        guard pArray.count == strArray.count else { return false }
        var dict = [String: String]()
        for i in 0..<pArray.count {
            let key = String(pArray[i])
            if let value = dict[key] {
                if value != strArray[i] {
                    return false
                }
            }else {
                if dict.values.contains(strArray[i]) {
                    return false
                }else {
                    dict[key] = strArray[i]
                }
            }
        }
        return true
    }
}
