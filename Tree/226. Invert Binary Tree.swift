//
//  226. Invert Binary Tree.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/5.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class InvertTreeSolution {
    func invertTree1(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        var queue = [TreeNode]()
        queue.append(root)
        while !queue.isEmpty {
            let curr = queue.removeFirst()
            let tmp = curr.left
            curr.left = curr.right
            curr.right = tmp
            if let left = curr.left {
                queue.append(left)
            }
            if let right = curr.right {
                queue.append(right)
            }
        }
        return root
    }
    
    
    func invertTree2(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        let tmp = root.left
        root.left = root.right
        root.right = tmp
        let _ = invertTree2(root.left)
        let _ = invertTree2(root.right)
        return root
    }
}
