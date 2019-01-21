//
//  811. Subdomain Visit Count.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2019/1/21.
//  Copyright © 2019 Lihao Li. All rights reserved.
//

import Foundation

class SubdomainVisits {
    func subdomainVisits(_ cpdomains: [String]) -> [String] {
        var counts = [String: Int]()
        for domain in cpdomains {
            let cpInfo = domain.components(separatedBy: " ")
            let frags = cpInfo[1].components(separatedBy: ".")
            if let count = Int(cpInfo[0]) {
                var curr = ""
                for i in (0..<frags.count).reversed() {
                    curr = frags[i] + (i < frags.count - 1 ? "." : "") + curr
                    if let value = counts[curr] {
                        counts[curr] = value + count
                    }else {
                        counts[curr] = count
                    }
                }
            }
        }
        
        var ans = [String]()
        for key in counts.keys {
            ans.append("\(counts[key]!) \(key)")
        }
        
        return ans
    }
}
