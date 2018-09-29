//
//  341. Flatten Nested List Iterator.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/28.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class FlattenNestedList {
    func flattenNestedList(array: [Any]) -> [Int] {
        var res = [Int]()
        for element in array {
            if let element = element as? Int {
                res.append(element)
            }else if let element = element as? [Any] {
                let result = flattenNestedList(array: element)
                result.forEach { (number) in
                    res.append(number)
                }
            }
        }
        return res
    }
}
