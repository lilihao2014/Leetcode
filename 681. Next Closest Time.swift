//
//  681. Next Closest Time.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2019/1/20.
//  Copyright © 2019 Lihao Li. All rights reserved.
//

import Foundation

class NextClosestTime {
    func nextClosestTime(_ time: String) -> String {
        let timeArray = time.components(separatedBy: ":")
        var curr = 0
        if let hours = Int(timeArray[0]) {
            curr += hours * 60
        }
        if let minutes = Int(timeArray[1]) {
            curr += minutes
        }
        var set = Set<Int>()
        for c in time {
            if c != ":", let value = Int(String(c)) {
                set.insert(value)
            }
        }
        
        while true {
            curr = (curr + 1) % (24 * 60)
            let digits = [curr / 60 / 10, curr / 60 % 10, curr % 60 / 10, curr % 60 % 10]
            for i in 0..<digits.count {
                if !set.contains(digits[i]) {
                    break
                }
                if i == digits.count - 1 {
                    return String(format: "%02d:%02d", curr / 60, curr % 60)
                }
            }
        }
    }
}
