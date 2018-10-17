//
//  104. Maximum Depth of Binary Tree.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/5.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class MaxDepthSolution {
    func maxDepth1(_ root: TreeNode?) -> Int {
        var height = 0
        guard let root = root else {
            return height
        }
        var queue = [TreeNode]()
        queue.append(root)
        while !queue.isEmpty {
            let count = queue.count
            for _ in 0..<count {
                let curr = queue.removeFirst()
                if let left = curr.left {
                    queue.append(left)
                }
                if let right = curr.right {
                    queue.append(right)
                }
            }
            height += 1
        }
        return height
    }
    
    
    func maxDepth2(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        return max(maxDepth2(root.left), maxDepth2(root.right)) + 1
    }
}
