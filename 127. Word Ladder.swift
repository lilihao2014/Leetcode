//
//  127. Word Ladder.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/26.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class LadderLength {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        if !wordList.contains(endWord) { return 0 }
        
        var stringArray = [String]()
        var distanceArray = [Int]()
        var wordList = wordList
        stringArray.append(beginWord)
        distanceArray.append(1)
        while !stringArray.isEmpty {
            let currentString = stringArray.removeFirst()
            let distance = distanceArray.removeFirst()
            for i in 0..<currentString.count {
                for c in "abcdefghijklmnopqrstuvwxyz" {
                 var charArray = Array(currentString)
                    charArray[i] = c
                    let newString = String(charArray)
                    if newString == endWord && wordList.contains(newString) {
                        return distance + 1
                    }
                    if wordList.contains(newString) {
                        stringArray.append(newString)
                        distanceArray.append(distance + 1)
                        wordList = wordList.filter(){$0 != newString}
                    }
                }
            }
        }
        return 0
    }
}
