//
//  156. Binary Tree Upside Down.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/8.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class UpsideDownBinaryTree {
    func upsideDownBinaryTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        guard let leftNode = root.left else { return root }
        
        let newNode = upsideDownBinaryTree(leftNode)
        leftNode.left = root.right
        leftNode.right = root
        root.left = nil
        root.right = nil
        return newNode
    }
}
