//
//  270. Closest Binary Search Tree Value.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/5.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class ClosestValue {
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        var res = Double(root?.val ?? 0)
        var root = root
        while root != nil {
            root = Double(root!.val) > target ? root?.left : root?.right
            if let root = root {
                let diff1 = abs(Double(root.val) - target)
                let diff2 = abs(res - target)
                if diff1 < diff2 {
                    res = Double(root.val)
                }
            }
        }
        return Int(res)
    }
}
