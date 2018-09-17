//
//  56. Merge Intervals.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/16.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class Merge {
    class Interval {
        public var start: Int
        public var end: Int
        public init(_ start: Int, _ end: Int) {
            self.start = start
            self.end = end
        }
    }
    
    func merge(_ intervals: [Interval]) -> [Interval] {
        guard intervals.count > 1 else { return intervals }
        
        var res = [Interval]()
        var intervals = intervals
        intervals.sort(){$0.start < $1.start}
        var lastStart = intervals[0].start, lastEnd = intervals[0].end
        for i in 1..<intervals.count {
            if intervals[i].start > lastEnd {
                res.append(Interval(lastStart, lastEnd))
                lastStart = intervals[i].start
                lastEnd = intervals[i].end
            }else {
                lastEnd = max(lastEnd, intervals[i].end)
            }
        }
        res.append(Interval(lastStart, lastEnd))
        return res
    }
}
