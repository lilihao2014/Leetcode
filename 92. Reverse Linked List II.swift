//
//  92. Reverse Linked List II.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/20.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class ReverseBetween {
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        var dummy = ListNode(0), prev = dummy
        dummy.next = head
        
        for _ in 1..<m {
            if let next = prev.next {
                prev = next
            }
        }
        
        let start = prev.next
        var next = start?.next
        
        for _ in 0..<n-m {
            start?.next = next?.next
            next?.next = prev.next
            prev.next = next
            next = start?.next
        }
        
        return dummy.next
    }
}
