//
//  4. Median of Two Sorted Arrays.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/15.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class FindMedianSortedArrays {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let count = nums1.count + nums2.count
        var res = Double()
        if count % 2 == 0 {
            res = Double(findMedian(nums1, nums2, 0, 0, count / 2) + findMedian(nums1, nums2, 0, 0, count / 2 + 1)) / 2.0
        }else {
            res = Double(findMedian(nums1, nums2, 0, 0, count / 2 + 1))
        }
        return res
    }
    
    
    private func findMedian(_ nums1: [Int], _ nums2: [Int], _ nums1_start: Int, _ nums2_start: Int, _ k: Int) -> Int {
        if nums1_start >= nums1.count {
            return nums2[nums2_start + k - 1]
        }else if nums2_start >= nums2.count {
            return nums1[nums1_start + k - 1]
        }
        if k == 1 {
            return min(nums1[nums1_start], nums2[nums2_start])
        }
        let nums1_value = nums1_start + k / 2 - 1 >= nums1.count ? Int.max : nums1[nums1_start + k / 2 - 1]
        let nums2_value = nums2_start + k / 2 - 1 >= nums2.count ? Int.max : nums2[nums2_start + k / 2 - 1]
        if nums1_value > nums2_value {
            return findMedian(nums1, nums2, nums1_start, nums2_start + k / 2, k - k / 2)
        }else {
            return findMedian(nums1, nums2, nums1_start + k / 2, nums2_start, k - k / 2)
        }
    }
}
