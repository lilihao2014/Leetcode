//
//  102. Binary Tree Level Order Traversal.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/5.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class levelOrder {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        guard let root = root else {
            return res
        }
        var queue = [TreeNode]()
        queue.append(root)
        while !queue.isEmpty {
            let count = queue.count
            var tmp = [Int]()
            for _ in 0..<count {
                let curr = queue.removeFirst()
                tmp.append(curr.val)
                if let left = curr.left {
                    queue.append(left)
                }
                if let right = curr.right {
                    queue.append(right)
                }
            }
            res.append(tmp)
        }
        return res
    }
}
