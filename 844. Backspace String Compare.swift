//
//  844. Backspace String Compare.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2019/1/20.
//  Copyright © 2019 Lihao Li. All rights reserved.
//

import Foundation

class BackspaceCompare {
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        let sArray = Array(S)
        let tArray = Array(T)
        
        return buildString(sArray) == buildString(tArray)
    }
    
    
    private func buildString(_ sArray: [Character]) -> String {
        var stack = [Character]()
        
        for c in sArray {
            if c == "#" {
                if !stack.isEmpty {
                    stack.removeLast()
                }
            }else {
                stack.append(c)
            }
        }
        
        return String(stack)
    }
}
