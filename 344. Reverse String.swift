//
//  344. Reverse String.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/18.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class ReverseString {
    func reverseString(_ s: String) -> String {
        var sArray = Array(s)
        var i = 0, j = sArray.count - 1
        while i < j {
            sArray.swapAt(i, j)
            i += 1
            j -= 1
        }
        return String(sArray)
    }
}
