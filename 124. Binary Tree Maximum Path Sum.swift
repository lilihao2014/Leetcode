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
        getMaxValue(root)
        return maxValue
    }
    
    
    @discardableResult
    private func getMaxValue(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var leftValue = Int.min, rightValue = Int.min
        
        if let left = root.left {
            leftValue = getMaxValue(left)
        }
        
        if let right = root.right {
            rightValue = getMaxValue(right)
        }
        
        leftValue = leftValue > 0 ? leftValue : 0
        rightValue = rightValue > 0 ? rightValue : 0
        
        if leftValue + rightValue + root.val > maxValue {
            maxValue = leftValue + rightValue + root.val
        }
        
        return max(leftValue, rightValue) + root.val
    }
    
}
