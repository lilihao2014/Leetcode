//
//  101. Symmetric Tree.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/5.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class isSymmetric {
    func isSymmetric2(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        var queue = [TreeNode]()
        if root.left != nil {
            if root.right == nil {
                return false
            }else {
                queue.append(root.left!)
                queue.append(root.right!)
            }
        }else if root.right != nil {
            return false
        }
        
        while !queue.isEmpty {
            if queue.count % 2 != 0 {
                return false
            }
            
            let left = queue.removeFirst()
            let right = queue.removeFirst()
            
            if left.val != right.val {
                return false
            }
            
            if left.left != nil && right.right != nil {
                queue.append(left.left!)
                queue.append(right.right!)
            }else {
                if left.left == nil && right.right == nil {
                    
                }else {
                    return false
                }
            }
            
            if left.right != nil && right.left != nil {
                queue.append(left.right!)
                queue.append(right.left!)
            }else {
                if left.right == nil && right.left == nil {
                    continue
                }else {
                    return false
                }
            }
        }
        return true
    }
    
    
    func isSymmetric1(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        return checkSymmetric(root.left, root.right)
    }
    
    
    private func checkSymmetric(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        guard let leftNode = left, let rightNode = right else {
            return left == nil && right == nil
        }
        if leftNode.val != rightNode.val {
            return false
        }
        return checkSymmetric(leftNode.left, rightNode.right) && checkSymmetric(leftNode.right, rightNode.left)
    }
}
