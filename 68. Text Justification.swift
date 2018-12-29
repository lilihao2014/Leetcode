//
//  68. Text Justification.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/12/28.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class FullJustify {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var result = [String]()
        var i = 0
        while i < words.count {
            var end = i, lenLine = 0
            while end < words.count && lenLine + words[end].count <= maxWidth {
                lenLine += words[end].count + 1
                end += 1
            }
            
            let isLast = end == words.count
            let countOfWords = end - i
            var line: String
            if countOfWords == 1 {
                line = words[i]
            }else {
                let noOfExtraSpaces = maxWidth - lenLine + 1
                let spaces = isLast ? 1 : 1 + noOfExtraSpaces / (countOfWords - 1)
                var extraSpace = isLast ? 0 : noOfExtraSpaces % (countOfWords - 1)
                line = createLine(i, end, spaces, &extraSpace, words)
            }
            correctLine(&line, maxWidth: maxWidth)
            result.append(line)
            i = end
        }
        return result
    }
    
    private func correctLine(_ line: inout String, maxWidth: Int) {
        while line.count < maxWidth {
            line.append(" ")
        }
        
        while line.count > maxWidth {
            line.remove(at: line.index(before: line.endIndex))
        }
    }
    
    private func createLine(_ start: Int, _ end: Int, _ space: Int, _ extraSpace: inout Int, _ words: [String]) -> String {
        var line = ""
        for i in start..<end {
            line.append(words[i])
            
            var ws = 0
            while ws < space {
                line.append(" ")
                ws += 1
            }
            
            if extraSpace > 0 {
                line.append(" ")
                extraSpace -= 1
            }
        }
        return line
    }
}
