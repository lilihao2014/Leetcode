//
//  273. Integer to English Words.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/16.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class NumberToWords {
    private let lessThan20 = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"]
    private let tens = ["", "Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"]
    private let thousands = ["", "Thousand", "Million", "Billion"]
    
    func numberToWords(_ num: Int) -> String {
        if num == 0 { return "Zero" }
        
        var i = 0
        var word = ""
        var num = num
        
        while num > 0 {
            if num % 1000 != 0 {
                word = helper(num: num % 1000) + thousands[i] + " " + word
            }
            num /= 1000
            i += 1
        }
        
        return word.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    private func helper(num: Int) -> String {
        if num == 0 { return "" }
        else if num < 20 { return lessThan20[num] + " "}
        else if num < 100 { return tens[num / 10] + " " + helper(num: num % 10)}
        else { return lessThan20[num / 100] + " Hundred " + helper(num:num % 100)}
    }
}
