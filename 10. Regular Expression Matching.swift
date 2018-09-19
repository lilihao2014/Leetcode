//
//  10. Regular Expression Matching.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/8.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class IsMatch {
    func isMatch1(_ s: String, _ p: String) -> Bool {
        if p.isEmpty { return s.isEmpty }
        
        let isFirstMatch = s.count != 0 && (p[p.index(p.startIndex, offsetBy: 0)..<p.index(p.startIndex, offsetBy: 1)] == "." || p[p.index(p.startIndex, offsetBy: 0)..<p.index(p.startIndex, offsetBy: 1)] == s[s.index(s.startIndex, offsetBy: 0)..<s.index(s.startIndex, offsetBy: 1)])
        
        if p.count >= 2 && p[p.index(p.startIndex, offsetBy: 1)..<p.index(p.startIndex, offsetBy: 2)] == "*" {
            return (isFirstMatch && isMatch1(String(s[s.index(s.startIndex, offsetBy: 1)...]), p)) || isMatch1(s, String(p[p.index(p.startIndex, offsetBy: 2)...]))
        }else {
            return isFirstMatch && isMatch1(String(s[s.index(s.startIndex, offsetBy: 1)...]), String(p[p.index(p.startIndex, offsetBy: 1)...]))
        }
    }
}
