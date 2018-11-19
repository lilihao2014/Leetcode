//
//  621. Task Scheduler.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/18.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class LeastInterval {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var countArray = [Int](repeating: 0, count: 26)
        var maxOccu = 0, maxCount = 0
        
        for c in tasks {
            let cu = String(c).utf8
            let value = Int(cu[cu.startIndex])
            countArray[value - 65] += 1
            if maxOccu == countArray[value - 65] {
                maxCount += 1
            }else if maxOccu < countArray[value - 65] {
                maxOccu = countArray[value - 65]
                maxCount = 1
            }
        }
        
        let partCount = maxOccu - 1
        let partLength = n - (maxCount - 1)
        let emptySlot = partCount * partLength
        let availableTasks = tasks.count - maxOccu * maxCount
        let idles = max(0, emptySlot - availableTasks)
        
        return tasks.count + idles
    }
}
