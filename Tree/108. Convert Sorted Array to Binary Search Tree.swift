//
//  108. Convert Sorted Array to Binary Search Tree.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/5.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class SortedArrayToBST {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return constructBST(nums, 0, nums.count - 1)
    }
    
    
    private func constructBST(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right {
            return nil
        }
        let mid = left + (right - left) / 2
        let root = TreeNode(nums[mid])
        root.left = constructBST(nums, left, mid - 1)
        root.right = constructBST(nums, mid + 1, right)
        return root
    }
}
