//
//  17. Letter Combinations of a Phone Number.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/8.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class LetterCombinations {
    func letterCombinations(_ digits: String) -> [String] {
        let numbersMap: [Character: String] = ["2": "abc", "3": "def", "4": "ghi", "5": "jkl", "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"]
        var res = [String]()
        var digitsArray = Array(digits)
        for i in 0..<digitsArray.count {
            let curr = digitsArray[i]
            guard let values = numbersMap[curr] else { return res }
            
            if i == 0 {
                for value in values {
                    res.append(String(value))
                }
            }else {
                while res.first!.count <= i {
                    let curr = res.removeFirst()
                    for value in values {
                        res.append(String(curr + String(value)))
                    }
                }
            }
        }
        return res
    }
}
