//
//  165. Compare Version Numbers.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/20.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class CompareVersion {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        let v1Array = version1.components(separatedBy: ".")
        let v2Array = version2.components(separatedBy: ".")
        
        for i in 0..<max(version1.count, version2.count) {
            let v1 = i < v1Array.count ? (Int(String(v1Array[i])) ?? 0) : 0
            let v2 = i < v2Array.count ? (Int(String(v2Array[i])) ?? 0) : 0
            
            if v1 < v2 {
                return -1
            }else if v1 > v2 {
                return 1
            }
        }
        
        return 0
    }
}
