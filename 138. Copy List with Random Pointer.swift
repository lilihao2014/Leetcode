//
//  138. Copy List with Random Pointer.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/16.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class CopyRandomList {
    class RandomListNode: NSObject {
        let label: Int
        var next: RandomListNode?
        var random: RandomListNode?
        init(_ label: Int) {
            self.label = label
            next = nil
            random = nil
        }
    }
    
    func copyRandomList(_ head: RandomListNode) -> RandomListNode? {
        var dict = [RandomListNode: RandomListNode]()
        var dummy = head
        while true {
            dict[dummy] = RandomListNode(dummy.label)
            guard let next = dummy.next else { break }
            dummy = next
        }
        dummy = head
        while true {
            if let next = dummy.next, let random = dummy.random {
                dict[dummy]?.next = dict[next]
                dict[dummy]?.random = dict[random]
            }
            guard let next = dummy.next else { break }
            dummy = next
        }
        return dict[head]
    }
}
