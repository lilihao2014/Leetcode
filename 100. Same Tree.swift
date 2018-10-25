//
//  100. Same Tree.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/5.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class IsSameTreeClass {
    func isSameTree1(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil || q == nil {
            return p == nil && q == nil
        }else if p?.val != q?.val {
            return false
        }
        return isSameTree1(p?.left, q?.left) && isSameTree1(p?.right, q?.right)
    }
    
    func isSameTree2(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard let pNode = p, let qNode = q else {
            return p == nil && q == nil
        }
        
        var pQueue = [TreeNode]()
        var qQueue = [TreeNode]()
        
        pQueue.append(pNode)
        qQueue.append(qNode)
        
        while !pQueue.isEmpty && !qQueue.isEmpty {
            let pCurr = pQueue.removeFirst()
            let qCurr = qQueue.removeFirst()
            
            guard pCurr.val == qCurr.val else {
                return false
            }
            
            if pCurr.left != nil && qCurr.left != nil {
                pQueue.append(pCurr.left!)
                qQueue.append(qCurr.left!)
            }else if pCurr.left == nil && qCurr.left == nil {
                
            }else {
                return false
            }
            
            if pCurr.right != nil && qCurr.right != nil {
                pQueue.append(pCurr.right!)
                qQueue.append(qCurr.right!)
            }else if pCurr.right == nil && qCurr.right == nil {
                
            }else {
                return false
            }
        }
        
        return pQueue.isEmpty && qQueue.isEmpty
    }
}
