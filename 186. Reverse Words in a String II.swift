//
//  186. Reverse Words in a String II.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/8.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class ReverseWordsInAString {
    func reverseWords(_ str: inout [Character]) {
        guard str.count > 1 else { return }
        
        var left = 0, right = str.count - 1
        reverseCharacters(&str, &left, &right)
        
        left = 0
        for i in 0..<str.count {
            if str[i] == " " {
                right = i - 1
                reverseCharacters(&str, &left, &right)
                left = i + 1
            }
        }
        
        right = str.count - 1
        if left != str.count {
            reverseCharacters(&str, &left, &right)
        }
    }
    
    private func reverseCharacters(_ str: inout [Character], _ left: inout Int, _ right: inout Int) {
        while left < right {
            str.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
}
