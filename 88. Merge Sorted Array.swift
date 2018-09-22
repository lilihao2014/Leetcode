//
//  88. Merge Sorted Array.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/21.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class MergeSortedArray {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var size = m + n
        var m = m, n = n
        while  m > 0 && n > 0 {
            if nums1[m - 1] < nums2[n - 1] {
                nums1[size - 1] = nums2[n - 1]
                n -= 1
            }else {
                nums1[size - 1] = nums1[m - 1]
                m -= 1
            }
            size -= 1
        }
        while n > 0 {
            nums1[size - 1] = nums2[n  - 1]
            n -= 1
            size -= 1
        }
    }
}
