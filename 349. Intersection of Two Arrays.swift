//
//  349. Intersection of Two Arrays.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/20.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class Intersection {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var set = Set<Int>()
        for num in nums1 {
            set.insert(num)
        }
        var res = [Int]()
        for num in nums2 {
            if set.contains(num) {
                res.append(num)
                set.remove(num)
            }
        }
        return res
    }
}
