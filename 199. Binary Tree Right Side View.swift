//
//  199. Binary Tree Right Side View.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/1.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class RightSideView {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        var queue = [TreeNode]()
        if let root = root {
            queue.append(root)
        }
        while !queue.isEmpty {
            let count = queue.count
            for i in 0..<count {
                let curr = queue.removeFirst()
                if let left = curr.left {
                    queue.append(left)
                }
                if let right = curr.right {
                    queue.append(right)
                }
                
                if i == count - 1 {
                    res.append(curr.val)
                }
            }
        }
        return res
    }
}
