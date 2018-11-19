//
//  929. Unique Email Addresses.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/18.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class NumUniqueEmails {
    func numUniqueEmails(_ emails: [String]) -> Int {
        var dict = [String: Set<String>]()
        for email in emails {
            let emailArray = email.components(separatedBy: "@")
            if emailArray.count == 2 {
                if var set = dict[emailArray[1]] {
                    set.insert(emailArray[1])
                }else {
                    var set = Set<String>()
                    set.insert(emailArray[0])
                    dict[emailArray[1]] = set
                }
            }
        }
        var count = 0
        for values in dict.values {
            count += values.count
        }
        return count
    }
}
