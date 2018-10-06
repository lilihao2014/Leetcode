//
//  94. Binary Tree Inorder Traversal.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/5.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class InorderTraversal {
    func inorderTraversal2(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        var stack = [TreeNode]()
        var rootCopy = root
        while !stack.isEmpty || rootCopy != nil {
            while rootCopy != nil {
                stack.insert(rootCopy!, at: 0)
                rootCopy = rootCopy?.left
            }
            let curr = stack.removeFirst()
            res.append(curr.val)
            rootCopy = curr.right
        }
        return res
    }
    
    
    func inorderTraversal1(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        guard let root = root else {
            return res
        }
        traversalAllNodes(&res, root)
        return res
    }
    
    func traversalAllNodes(_ res: inout [Int], _ root: TreeNode?) {
        guard let root = root else {
            return
        }
        traversalAllNodes(&res, root.left)
        res.append(root.val)
        traversalAllNodes(&res, root.right)
    }
}
