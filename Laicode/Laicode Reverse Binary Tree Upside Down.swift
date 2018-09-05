//
//  Laicode Reverse Binary Tree Upside Down.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/4.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class ReverseUpsideDown {
    func reverse(root: TreeNode?) -> TreeNode? {
        if root == nil || root!.left == nil {
            return root
        }
        
        let newRoot = reverse(root: root!.left)
        root!.left?.right = root!.right
        root!.left?.left = root!
        root?.left = nil
        root?.right = nil
        return newRoot
    }
}
