//
//  28. Implement strStr().swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/24.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class StrStr {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.count > haystack.count { return -1 }
        
        var haystackArray = Array(haystack)
        var needleArray = Array(needle)
        
        for i in 0...haystackArray.count - needleArray.count {
            var flag = true
            for j in 0..<needleArray.count {
                if needleArray[j] != haystackArray[i + j] {
                    flag = false
                    break
                }
            }
            
            if flag == true { return i }
        }
        
        return -1
    }
}
