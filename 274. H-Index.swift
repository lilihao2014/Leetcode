//
//  274. H-Index.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/5.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class HIndex {
    func hIndex(_ citations: [Int]) -> Int {
        guard !citations.isEmpty else { return 0 }
        
        let n = citations.count
        var countArray = [Int](repeating: 0, count: n + 1)
        for i in 0..<n {
            if citations[i] > n {
                countArray[n] += 1
            }else {
                countArray[citations[i]] += 1
            }
        }
        for i in (1..<countArray.count).reversed() {
            if countArray[i] >= i {
                return i
            }else {
                countArray[i - 1] += countArray[i]
            }
        }
        return 0
    }
}
