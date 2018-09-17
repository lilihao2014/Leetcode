//
//  141. Linked List Cycle.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/16.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class HasCycle {
    func hasCycle(head: ListNode?) -> Bool {
        if head == nil || head?.next == nil { return false }
        
        var slow = head, fast = head
        while fast?.next != nil && fast?.next?.next != nil {
            if slow?.next == fast || slow?.next?.next == fast {
                return true
            }
            fast = fast?.next?.next
            slow = slow?.next
        }
        return false
    }
}
