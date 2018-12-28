//
//  124. Binary Tree Maximum Path Sum.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/28.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class MaxPathSum {
    
    var maxValue = Int.min
    
    func maxPathSum(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        helper(root)
        return maxValue
    }
    
    
    @discardableResult
    private func helper(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        let leftValue = max(0, helper(root.left))
        let rightValue = max(0, helper(root.right))
        
        if leftValue + root.val + rightValue > maxValue {
            maxValue = leftValue + root.val + rightValue
        }
        return max(leftValue, rightValue) + root.val
    }
    
}
