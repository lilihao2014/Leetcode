//
//  336. Palindrome Pairs.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2019/1/21.
//  Copyright © 2019 Lihao Li. All rights reserved.
//

import Foundation

class PalindromePairs {
    
    func palindromePairs(_ words: [String]) -> [[Int]] {
        var res = [[Int]]()
        if words.count < 2 { return res }
        
        var dict = [String: Int]()
        for i in 0..<words.count {
            dict[words[i]] = i
        }
        
        for i in 0..<words.count {
            for j in 0..<words[i].count + 1 {
                let str1 = String(words[i][words[i].index(words[i].startIndex, offsetBy: 0)..<words[i].index(words[i].startIndex, offsetBy: j)])
                let str2 = String(words[i][words[i].index(words[i].startIndex, offsetBy: j)..<words[i].endIndex])
                if isPalindrome(str1) {
                    let reversedStr2 = String(str2.reversed())
                    if let index = dict[reversedStr2], index != i {
                        let tmp = [index, i]
                        res.append(tmp)
                    }
                }
                
                if isPalindrome(str2) {
                    let reversedStr1 = String(str1.reversed())
                    if let index = dict[reversedStr1], index != i, str2.count != 0 {
                        let tmp = [i, index]
                        res.append(tmp)
                    }
                }
            }
        }
        
        return res
    }
    
    
    private func isPalindrome(_ str: String) -> Bool {
        var left = 0, right = str.count - 1
        
        while left < right {
            if str[str.index(str.startIndex, offsetBy: left)] != str[str.index(str.startIndex, offsetBy: right)] {
                return false
            }
            
            left += 1
            right -= 1
        }
        
        return true
    }
    
}
