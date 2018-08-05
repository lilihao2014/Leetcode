//
//  235. Lowest Common Ancestor of a Binary Search Tree.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/5.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class LowestCommonAncestor {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode, _ q: TreeNode) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        if p.val < root.val && q.val < root.val {
            return lowestCommonAncestor(root.left, p, q)
        }else if p.val > root.val && q.val > root.val {
            return lowestCommonAncestor(root.right, p, q)
        }
        return root
    }
}
