//
//  105. Construct Binary Tree from Preorder and Inorder Traversal.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/5.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class BuildTree {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        return constructTree(preorder, inorder, 0, 0, inorder.count - 1)
    }
    
    func constructTree(_ preorder: [Int], _ inorder: [Int], _ preorderStart: Int, _ inorderStart: Int, _ inorderEnd: Int) -> TreeNode? {
        if preorderStart >= preorder.count || inorderStart > inorderEnd {
            return nil
        }
        
        var index = -1
        for i in inorderStart...inorderEnd {
            if inorder[i] == preorder[preorderStart] {
                index = i
                break
            }
        }
        
        let root = TreeNode(preorder[preorderStart])
        root.left = constructTree(preorder, inorder, preorderStart + 1, inorderStart, index - 1)
        root.right = constructTree(preorder, inorder, preorderStart + index - inorderStart + 1, index + 1, inorderEnd)
        return root
    }
}
