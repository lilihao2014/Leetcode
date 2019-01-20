//
//  904. Fruit Into Baskets.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2019/1/20.
//  Copyright © 2019 Lihao Li. All rights reserved.
//

import Foundation

class TotalFruit {
    func totalFruit(_ tree: [Int]) -> Int {
        var ans = 0, i = 0
        var dict = [Int: Int]()
        for j in 0..<tree.count {
            dict[tree[j]] = (dict[tree[j]] ?? 0) + 1
            while dict.count >= 3 {
                if let value = dict[tree[i]] {
                    if value == 1 {
                        dict[tree[i]] = nil
                    }else {
                        dict[tree[i]] = value - 1
                    }
                }
                i += 1
            }
            ans = max(ans, j - i + 1)
        }
        return ans
    }
}
