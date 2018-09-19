//
//  771. Jewels and Stones.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/15.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class NumJewelsInStones {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        let jSet = Set(J)
        var count = 0
        for character in S {
            if jSet.contains(character) {
                count += 1
            }
        }
        return count
    }
}
