//
//  269. Alien Dictionary.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/18.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class AlienOrder {
    func alienOrder(_ words: [String]) -> String {
        var map = [Character: Set<Character>]()
        var degree = [Character: Int]()
        var res = ""
        
        for word in words {
            let wordArray = Array(word)
            for c in wordArray {
                degree[c] = 0
            }
        }
        
        for i in 0..<words.count - 1 {
            let curr = words[i]
            let next = words[i + 1]
            let minCount = min(curr.count, next.count)
            for j in 0..<minCount {
                let c1 = curr[curr.index(curr.startIndex, offsetBy: j)]
                let c2 = next[next.index(next.startIndex, offsetBy: j)]
                if c1 != c2 {
                    var set = Set<Character>()
                    if let charSet = map[c1] {
                        set = charSet
                    }
                    if !set.contains(c2) {
                        set.insert(c2)
                        map[c1] = set
                        degree[c2] = (degree[c2] ?? 0) + 1
                    }
                    break
                }
            }
        }
        
        var queue = [Character]()
        let zeroDegreeDict = degree.filter { $1 == 0 }
        for key in zeroDegreeDict.keys {
            queue.append(key)
        }
        
        while !queue.isEmpty {
            let c = queue.removeFirst()
            res += String(c)
            if let set = map[c] {
                for c2 in set {
                    if let value = degree[c2] {
                        degree[c2] = value - 1
                        if value == 1 {
                            queue.append(c2)
                        }
                    }
                }
            }
        }
        
        if res.count != degree.count { return "" }
        return res
    }
}
