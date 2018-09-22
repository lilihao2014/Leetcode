//
//  253. Meeting Rooms II.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/21.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class MinMeetingRooms {
    class Interval {
        var start: Int
        var end: Int
        init(_ start: Int, _ end: Int) {
            self.start = start
            self.end = end
        }
    }
    
    
    func minMeetingRooms(_ intervals: [Interval]) -> Int {
        var startArray = [Int]()
        var endArray = [Int]()
        
        intervals.forEach { (interval) in
            startArray.append(interval.start)
            endArray.append(interval.end)
        }
        
        startArray.sort(){$0 < $1}
        endArray.sort(){$0 < $1}
        
        var start = 0, end = 0, rooms = 0
        while start < startArray.count {
            if startArray[start] >= endArray[end] {
                rooms -= 1
                end += 1
            }
            rooms += 1
            start += 1
        }
        return rooms
    }
}
