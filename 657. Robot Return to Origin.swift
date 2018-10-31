//
//  657. Robot Return to Origin.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/30.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class JudgeCircle {
    func judgeCircle(_ moves: String) -> Bool {
        var xDistance = 0, yDistance = 0
        for c in moves {
            switch c {
            case "U":
                yDistance += 1
                break
            case "D":
                yDistance -= 1
                break
            case "L":
                xDistance -= 1
            case "R":
                xDistance += 1
            default:
                break
            }
        }
        return xDistance == 0 && yDistance == 0
    }
}
