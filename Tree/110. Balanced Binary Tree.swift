//
//  110. Balanced Binary Tree.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/5.
//  Copyright © 2018 Lihao Li. All rights reserved.
// Time: O(nlogn)

import Foundation

class IsBalanced {
    func isBalanced(_ root: TreeNode?) -> Bool {
        return getHeight(root) != -1
    }
    
    private func getHeight(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        let leftHeight = getHeight(root.left)
        if leftHeight == -1 {
            return -1
        }
        let rightHeight = getHeight(root.right)
        if rightHeight == -1 {
            return -1
        }
        if abs(leftHeight - rightHeight) > 1 {
            return -1
        }
        return max(leftHeight, rightHeight) + 1
    }
}
