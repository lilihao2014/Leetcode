//
//  124. Binary Tree Maximum Path Sum.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/5.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class MaxPathSum {
    
    var maxValue = Int.min
    
    func maxPathSum(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return maxValue
        }
        maxValue = root.val
        _ = getMax(root)
        return maxValue
    }
    
    private func getMax(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var leftValue = Int.min, rightValue = Int.min
        
        if let _ = root.left {
            leftValue = getMax(root.left!)
        }
        
        if let _ = root.right {
            rightValue = getMax(root.right)
        }
        
        leftValue = leftValue > 0 ? leftValue : 0
        rightValue = rightValue > 0 ? rightValue : 0
    
        if leftValue + rightValue + root.val > maxValue {
            maxValue = leftValue + rightValue + root.val
        }
        
        return max(leftValue, rightValue) + root.val
    }
}
