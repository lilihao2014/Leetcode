//
//  451. Sort Characters By Frequency.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/24.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class FrequencySort {
    func frequencySort(_ s: String) -> String {
        let sArray = Array(s)
        var dict = [Character: Int]()
        
        for c in sArray {
            if let value = dict[c] {
                dict[c] = value + 1
            }else {
                dict[c] = 1
            }
        }
        
        let resArray = dict.sorted { $0.value > $1.value }
        var res = ""
        for (key, value) in resArray {
            for _ in 0..<value {
                res.append(key)
            }
        }
        return res
    }
}
