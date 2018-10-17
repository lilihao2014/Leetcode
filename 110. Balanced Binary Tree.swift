//
//  110. Balanced Binary Tree.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/5.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class IsBalanced {
    func isBalanced(_ root: TreeNode?) -> Bool {
        return checkBalanced(root) != nil
    }
    
    private func checkBalanced(_ root: TreeNode?) -> Int? {
        guard let root = root else { return 0 }
        
        guard let left = checkBalanced(root.left) else { return nil }
        guard let right = checkBalanced(root.right) else { return nil }
        
        if abs(left - right) > 1 { return nil }
        
        return max(left, right) + 1
    }
}
