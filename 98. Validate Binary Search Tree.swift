//
//  98. Validate Binary Search Tree.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/24.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class IsValidBST {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return helper(root, Int.max, Int.min)
    }
    
    private func helper(_ root: TreeNode?, _ maxValue: Int, _ minValue: Int) -> Bool {
        guard let root = root else { return true }
        if root.val <= minValue || root.val >= maxValue {
            return false
        }
        return helper(root.left, root.val, minValue) && helper(root.right, maxValue, root.val)
    }
}
