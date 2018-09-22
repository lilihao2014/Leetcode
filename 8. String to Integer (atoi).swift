//
//  8. String to Integer (atoi).swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/21.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class MyAtoi {
    func myAtoi(_ str: String) -> Int {
        var res = 0
        var start = 0
        if str.isEmpty {
            return res
        }
        
        let charArray = Array(str)
        while start < charArray.count && charArray[start] == " " {
            start += 1
        }
        
        guard start < charArray.count else { return res }
        
        var flag = 1
        if charArray[start] == "+" {
            start += 1
        }else if charArray[start] == "-" {
            start += 1
            flag = -1
        }
        
        let int_max = 2147483647
        let int_min = -2147483648
        
        while start < charArray.count {
            if let num = Int(String(charArray[start])) {
                res = res * 10 + num
                
                if res >= int_max {
                    if flag == 1 {
                        return int_max
                    }else if res > int_max && flag == -1 {
                        return int_min
                    }
                }
                start += 1
            }else {
                break
            }
        }
        return res * flag
    }
}
