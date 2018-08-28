//
//  Laicode String Abbreviation Matching.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/28.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class Match {
    // Iterative
    func match1(input: String, pattern: String) -> Bool {
        var si = 0, ti = 0
        let inputArray = Array(input)
        let patternArray = Array(pattern)
        
        while si < inputArray.count && ti < patternArray.count {
            if let _ = Int(String(patternArray[ti])) {
                var count = 0;
                while ti < patternArray.count , let value = Int(String(patternArray[ti])) {
                    count = count * 10 + value
                    ti += 1
                }
                si += count
            }else {
                if inputArray[si] != patternArray[ti] {
                    return false
                }
                si += 1
                ti += 1
            }
        }
        return si == input.count && ti == pattern.count
    }
    
    
    //Recursion
    func match2(input: String, pattern: String) -> Bool {
        var ti = 0
        return matchHelper(inputArray: Array(input), patternArray: Array(pattern), si: 0, ti: &ti)
    }
    
    
    private func matchHelper(inputArray: [Character], patternArray: [Character], si: Int, ti: inout Int) -> Bool {
        if si == inputArray.count, ti == patternArray.count {
            return true
        }
        if si > inputArray.count || ti > patternArray.count {
            return false
        }
        
        if let _ = Int(String(patternArray[ti])) {
            var count = 0
            while ti < patternArray.count, let value = Int(String(patternArray[ti])) {
                count = count * 10 + value
                ti += 1
            }
            return matchHelper(inputArray: inputArray, patternArray: patternArray, si: si + count, ti: &ti)
        }else {
            if inputArray[si] == patternArray[ti] {
                ti += 1
                return matchHelper(inputArray: inputArray, patternArray: patternArray, si: si + 1, ti: &ti)
            }else {
                return false
            }
        }
    }
    
}
