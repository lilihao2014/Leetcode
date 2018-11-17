//
//  17. Letter Combinations of a Phone Number.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/8.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class LetterCombinations {
    private let numbersMap: [Character: String] = ["2": "abc", "3": "def", "4": "ghi", "5": "jkl", "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"]
    
    func letterCombinations(_ digits: String) -> [String] {
        var queue = [String]()
        for (index, key) in digits.enumerated() {
            guard let valueString = numbersMap[key] else { return queue }
            
            if index == 0 {
                for element in valueString {
                    queue.append(String(element))
                }
            }else {
                while queue.first!.count <= index {
                    let previousValue = queue.removeFirst()
                    for element in valueString {
                        queue.append(previousValue + String(element))
                    }
                }
            }
        }
        return queue
    }
}
