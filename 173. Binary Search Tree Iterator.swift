//
//  173. Binary Search Tree Iterator.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/5.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class BSTIterator {
    private var stack = [TreeNode]()
    
    init(_ root: TreeNode?) {
        var curr = root
        while curr != nil {
            stack.insert(curr!, at: 0)
            curr = curr?.left
        }
    }
    
    
    func hasNext() -> Bool {
        return !stack.isEmpty
    }
    
    
    func next() -> Int {
        let curr = stack.removeFirst()
        var node = curr.right
        while node != nil {
            stack.insert(node!, at: 0)
            node = node?.left
        }
        return curr.val
    }
}
