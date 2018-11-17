//
//  482. License Key Formatting.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/16.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class LicenseKeyFormatting {
    func licenseKeyFormatting(_ S: String, _ K: Int) -> String {
        let s = S.uppercased().replacingOccurrences(of: "-", with: "")
        var res = ""
        var counter = 0
        for i in (0..<s.count).reversed() {
            res += String(s[s.index(s.startIndex, offsetBy: i)])
            counter += 1
            if counter % K == 0 && i != 0 {
                res += "-"
            }
        }
        return String(res.reversed())
    }
}
