//
//  394. Decode String.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2019/1/21.
//  Copyright © 2019 Lihao Li. All rights reserved.
//

import Foundation

class DecodeString {
    
    func decodeString(_ s: String) -> String {
        var queue = [Character]()
        for c in s {
            queue.append(c)
        }
        
        return helper(&queue)
    }
    
    
    private func helper(_ queue: inout [Character]) -> String {
        var res = ""
        var num = 0
        
        while !queue.isEmpty {
            let c = queue.removeFirst()
            
            if let value = Int(String(c)) {
                num = num * 10 + value
            }else if c == "[" {
                let tmp = helper(&queue)
                for _ in 0..<num {
                    res.append(tmp)
                }
                num = 0
            }else if c == "]" {
                break
            }else {
                res.append(c)
            }
        }
        
        return res
    }
    
}
