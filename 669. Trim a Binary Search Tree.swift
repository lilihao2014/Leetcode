//
//  669. Trim a Binary Search Tree.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/5.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class TrimBST {
    func trimBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        if root.val > R {
            return trimBST(root.left, L, R)
        }else if root.val < L {
            return trimBST(root.right, L, R)
        }
        
        root.left = trimBST(root.left, L, R)
        root.right = trimBST(root.right, L, R)
        return root
    }
}
