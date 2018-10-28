//
//  230. Kth Smallest Element in a BST.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/28.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class KthSmallest {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        return getSmallestValue(root, k)
    }
    
    
    private func getSmallestValue(_ root: TreeNode?, _ k: Int) -> Int {
        var root = root
        var res = [Int]()
        var stack = [TreeNode]()
        while !stack.isEmpty || root != nil {
            while root != nil {
                stack.insert(root!, at: 0)
                root = root!.left
            }
            
            let curr = stack.removeFirst()
            res.append(curr.val)
            root = curr.right
        }
        
        return res[k - 1]
    }
}
