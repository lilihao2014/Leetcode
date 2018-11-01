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
        return constructMaximumBinaryTreeHelper(0, nums.count - 1, nums)
    }
    
    
    private func constructMaximumBinaryTreeHelper(_ left: Int, _ right: Int, _ nums: [Int]) -> TreeNode? {
        if left > right {
            return nil
        }
        
        let maxIndex = findMaxIndex(left, right, nums)
        let root = TreeNode(nums[maxIndex])
        root.left = constructMaximumBinaryTreeHelper(left, maxIndex - 1, nums)
        root.right = constructMaximumBinaryTreeHelper(maxIndex + 1, right, nums)
        return root
    }
    
    
    private func findMaxIndex(_ left: Int, _ right: Int, _ nums: [Int]) -> Int {
        var maxValue = Int.min, maxIndex = -1
        for i in left..<right+1 {
            if nums[i] > maxValue {
                maxValue = nums[i]
                maxIndex = i
            }
        }
        return maxIndex
    }
}
