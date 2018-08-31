//
//  Laicode Get Keys In Binary Tree Layer By Layer Zig-Zag Order .swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/30.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class ZigZag {
    func zigZag(root: TreeNode?) -> [Int] {
        var res = [Int]()
        guard let root = root else {
            return res;
        }
        var nodes = [TreeNode]()
        nodes.append(root)
        var rightToLeft = true
        while !nodes.isEmpty {
            let size = nodes.count
            for _ in 0..<size {
                if rightToLeft {
                    let curr = nodes.removeLast()
                    res.append(curr.val)
                    
                    if let right = curr.right {
                        nodes.insert(right, at: 0)
                    }
                    
                    if let left = curr.left {
                        nodes.insert(left, at: 0)
                    }
                }else {
                    let curr = nodes.removeFirst()
                    res.append(curr.val)
                    
                    if let left = curr.left {
                        nodes.append(left)
                    }
                    
                    if let right = curr.right {
                        nodes.append(right)
                    }
                }
            }
            rightToLeft = !rightToLeft
        }
        return res
    }
}
