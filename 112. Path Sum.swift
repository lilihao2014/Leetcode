//
//  112. Path Sum.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/11.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class HasPathSum {
    func hasPathSum1(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard let root = root else { return false }
        
        var queue = [TreeNode]()
        queue.append(root)
        while !queue.isEmpty {
            let curr = queue.removeFirst()
            if curr.left == nil && curr.right == nil {
                if curr.val == sum {
                    return true
                }else {
                    continue
                }
            }
            if let leftNode = curr.left {
                leftNode.val += curr.val
                queue.append(leftNode)
            }
            if let rightNode = curr.right {
                rightNode.val += curr.val
                queue.append(rightNode)
            }
        }
        return false
    }
    
    
    func hasPathSum2(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard let root = root else { return false }
        
        if root.left == nil && root.right == nil {
            return root.val == sum
        }
        
        return hasPathSum2(root.left, sum - root.val) || hasPathSum2(root.right, sum - root.val)
    }
}
