//
//  151. Reverse Words in a String.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/22.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class ReverseWords {
    func reverseWords(s: String) -> String {
        var sArray = s.components(separatedBy: " ")
        var start = 0, end = sArray.count - 1
        while start < end {
            sArray.swapAt(start, end)
            start += 1
            end -= 1
        }
        var res = String()
        sArray.forEach { (string) in
            res += string + " "
        }
        return res.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
