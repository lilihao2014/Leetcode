//
//  642. Design Search Autocomplete System.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2019/1/21.
//  Copyright © 2019 Lihao Li. All rights reserved.
//

import Foundation


class AutocompleteSystem {
    class Node {
        let sentence: String
        let times: Int
        
        init(_ st: String, _ t: Int) {
            sentence = st
            times = t
        }
    }
    
    class Trie {
        var times = 0
        var branches = [Trie?](repeating: nil, count: 27)
    }
    
    
    func getIndex(_ c: Character) -> Int {
        if c == " " { return 26 }
        else {
            let utf8 = String(c).utf8
            let value = Int(utf8[utf8.startIndex])
            return value - 97
        }
    }
    
    
    func getTwoIndex(_ a: Character, _ b: Character) -> Int {
        let utf81 = String(a).utf8
        let value1 = Int(utf81[utf81.startIndex])
        
        let utf82 = String(b).utf8
        let value2 = Int(utf82[utf82.startIndex])
        
        return value1 - value2
    }
    
    
    func insert(_ t: inout Trie, _ s: String, _ times: Int) {
        for c in s {
            if t.branches[getIndex(c)] == nil {
                t.branches[getIndex(c)] = Trie()
            }
            t = t.branches[getIndex(c)]!
        }
        
        t.times += times
    }
    
    
    func lookup(_ t: inout Trie, _ s: String) -> [Node] {
        var list = [Node]()
        for c in s {
            if t.branches[getIndex(c)] == nil {
                return [Node]()
            }
            t = t.branches[getIndex(c)]!
        }
        traverse(s, t, &list)
        return list
    }
    
    
    func traverse(_ s: String, _ t: Trie, _ list: inout [Node]) {
        if t.times > 0 {
            list.append(Node(s, t.times))
        }
        
        for c in "abcdefghijklmnopqrstuvwxyz" {
            if t.branches[getTwoIndex(c, "a")] != nil {
                traverse(s + String(c), t.branches[getTwoIndex(c, "a")]!, &list)
            }
        }
        
        if t.branches[26] != nil {
            traverse(s + " ", t.branches[26]!, &list)
        }
    }
    
    let root: Trie = Trie()
    init(_ sentences: [String], _ times: [Int]) {
        
        for i in 0..<sentences.count {
            var rootCopy = root
            insert(&rootCopy, sentences[i], times[i])
        }
    }
    
    var curr = ""
    func input(_ c: Character) -> [String] {
        var res = [String]()
        var rootCopy = root
        
        if c == "#" {
            insert(&rootCopy, curr, 1)
            curr = ""
        }else {
            curr.append(c)
            var list = lookup(&rootCopy, curr)
            list.sort { $0.times > $1.times }
            list.sort { (node0, node1) -> Bool in
                if node0.times == node1.times {
                    return node0.sentence < node1.sentence
                }
                return node0.times > node1.times
            }
            for i in 0..<min(3, list.count) {
                res.append(list[i].sentence)
            }
        }
        return res
    }
}
