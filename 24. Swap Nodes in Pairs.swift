//
//  24. Swap Nodes in Pairs.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/1.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class SwapPairs {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head!.next == nil { return head }
        let newHead = head?.next
        var head = head
        var prev: ListNode?
        while head != nil && head!.next != nil {
            let tmp = head!.next
            head!.next = head!.next!.next
            tmp!.next = head
            if prev != nil {
                prev!.next = tmp
            }
            prev = head!
            head = head!.next
        }
        
        return newHead
    }
}
