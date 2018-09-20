//
//  819. Most Common Word.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/19.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class MostCommonWord {
    func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
        var dict = [String: Int]()
        paragraph.enumerateSubstrings(in: paragraph.startIndex..<paragraph.endIndex, options: .byWords) { (ss, r, r2, stop) in
            if let ss = ss?.lowercased(), banned.contains(ss) == false {
                if let value = dict[ss] {
                    dict[ss] = value + 1
                }else {
                    dict[ss] = 1
                }
            }
        }
        var sortedByValueDictionary = dict.sorted{$0.1 > $1.1}
        return sortedByValueDictionary.count > 0 ? sortedByValueDictionary[0].0 : ""
    }
}
