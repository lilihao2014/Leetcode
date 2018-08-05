//
//  617. Merge Two Binary Trees.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/5.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class mergeTreesSolution {
    func mergeTrees1(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        guard let t1 = t1 else {
            return t2
        }
        guard let t2 = t2 else {
            return t1
        }
        t1.val += t2.val
        t1.left = mergeTrees1(t1.left, t2.left)
        t1.right = mergeTrees1(t1.right, t2.right)
        return t1
    }
    
    
    func mergeTree2(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        guard let t1 = t1 else {
            return t2
        }
        guard let t2 = t2 else {
            return t1
        }
        var queue = [[TreeNode?]]()
        queue.append([t1, t2])
        while !queue.isEmpty {
            let curr = queue.removeFirst()
            guard let _ = curr[1] else {
                continue
            }
            curr[0]?.val += curr[1]!.val
            if curr[0]?.left == nil {
                curr[0]?.left = curr[1]!.left
            }else {
                queue.append([curr[0]?.left, curr[1]!.left])
            }
            if curr[0]?.right == nil {
                curr[0]?.right = curr[1]!.right
            }else {
                queue.append([curr[0]?.right, curr[1]!.right])
            }
        }
        
        return t1
    }
}
