//
//  208. Implement Trie (Prefix Tree).swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/9.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class Trie {
    class TrieNode {
        var value: Character?
        weak var parent: TrieNode?
        var children = [Character: TrieNode]()
        var isTerminating = false
        
        init(value: Character?, parent: TrieNode?) {
            self.value = value
            self.parent = parent
        }
        
        
        func add(child: Character) {
            guard children[child] == nil else { return }
            children[child] = TrieNode(value: child, parent: self)
        }
    }
    
    private let root = TrieNode(value: nil, parent: nil)
    
    
    init() {
        
    }
    
    
    func insert(_ word: String) {
        guard !word.isEmpty else { return }
        let wordArray = Array(word)
        var index = 0
        var currentNode = root
        
        while index < wordArray.count {
            let character = wordArray[index]
            
            if let child = currentNode.children[character] {
                currentNode = child
            }else {
                currentNode.add(child: character)
                currentNode = currentNode.children[character]!
            }
            index += 1
        }
        
        if index == wordArray.count {
            currentNode.isTerminating = true
        }
    }
    
    
    func search(_ word: String) -> Bool {
        guard !word.isEmpty else { return false }
        
        var currentNode = root
        let wordArray = Array(word)
        var index = 0
        while index < wordArray.count, let child = currentNode.children[wordArray[index]] {
            currentNode = child
            index += 1
        }
        
        if index == wordArray.count && currentNode.isTerminating == true {
            return true
        }else {
            return false
        }
    }
    
    
    func startsWith(_ prefix: String) -> Bool {
        guard !prefix.isEmpty else { return true }
        
        var index = 0
        var currentNode = root
        var prefixArray = Array(prefix)
        
        while index < prefixArray.count, let child = currentNode.children[prefixArray[index]] {
            index += 1
            currentNode = child
        }
        
        if index == prefixArray.count {
            return true
        }else {
            return false
        }
    }
}
