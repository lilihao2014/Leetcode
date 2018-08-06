//
//  654. Maximum Binary Tree.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/5.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class ConstructMaximumBinaryTree {
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        return constructTree(nums, 0, nums.count - 1)
    }
    
    
    private func constructTree(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right {
            return nil
        }
        let maxIndex = findMaxIndex(nums, left, right)
        let root = TreeNode(nums[maxIndex])
        root.left = constructTree(nums, left, maxIndex - 1)
        root.right = constructTree(nums, maxIndex + 1, right)
        return root
    }
    
    
    private func findMaxIndex(_ nums: [Int], _ left: Int, _ right: Int) -> Int {
        var index = -1, maxValue = Int.min
        for i in left...right {
            if nums[i] > maxValue {
                maxValue = nums[i]
                index = i
            }
        }
        return index
    }
}
