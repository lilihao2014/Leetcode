//
//  236. Lowest Common Ancestor of a Binary Tree.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/5.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class LowestCommonAncestor {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode, _ q: TreeNode) -> TreeNode? {
        guard let root = root else { return nil }
        
        if root == p || root == q { return root }
        
        let left = lowestCommonAncestor(root.left, p, q)
        let right = lowestCommonAncestor(root.right, p, q)
        
        if left != nil && right != nil {
            return root
        }else if left != nil {
            return left
        }else {
            return right
        }
    }
}
