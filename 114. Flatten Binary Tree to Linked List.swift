//
//  114. Flatten Binary Tree to Linked List .swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/20.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class Flatten {
    func flatten(_ root: TreeNode?) {
        var root = root
        
        while root != nil {
            if root?.left == nil {
                root = root?.right
                continue
            }
            
            var rootLeft = root?.left
            while rootLeft?.right != nil {
                rootLeft = rootLeft?.right
            }
            
            rootLeft?.right = root?.right
            root?.right = root?.left
            root?.left = nil
            root = root?.right
        }
    }
}
