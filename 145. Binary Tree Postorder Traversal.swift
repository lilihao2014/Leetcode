//
//  145. Binary Tree Postorder Traversal.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/8.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class PostorderTraversal {
    //Recursion
    func postorderTraversal1(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        traverseNodes(root, &res)
        return res
    }
    
    private func traverseNodes(_ root: TreeNode?, _ res: inout [Int]) {
        guard let root = root else { return }
        
        traverseNodes(root.left, &res)
        traverseNodes(root.right, &res)
        res.append(root.val)
    }
    
    
    func postorderTraversal2(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [Int]() }
        
        var res = [Int]()
        var stack = [TreeNode]()
        stack.append(root)
        while !stack.isEmpty {
            let curr = stack.removeFirst()
            res.insert(curr.val, at: 0)
            if let leftNode = curr.left {
                stack.insert(leftNode, at: 0)
            }
            if let rightNode = curr.right {
                stack.insert(rightNode, at: 0)
            }
        }
        return res
    }
}
