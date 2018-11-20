//
//  67. Add Binary.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/20.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class AddBinary {
    func addBinary(_ a: String, _ b: String) -> String {
        var res = ""
        var carry = 0
        var aArray = Array(a)
        var bArray = Array(b)
        while aArray.count != bArray.count {
            if aArray.count < bArray.count {
                aArray.insert("0", at: 0)
            }else {
                bArray.insert("0", at: 0)
            }
        }
        
        for i in (0..<aArray.count).reversed() {
            let currSum = Int(String(aArray[i]))! + Int(String(bArray[i]))! + carry
            carry = currSum / 2
            res = String(currSum % 2) + res
        }
        if carry == 1 {
            res = "1" + res
        }
        return res
    }
}
