//
//  206. Reverse Linked List.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/16.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class ReverseList {
    func reverseList1(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
        
        var curr = head
        var newHead: ListNode?
        
        while curr != nil {
            let tmp = curr
            curr = curr?.next
            tmp?.next = newHead
            newHead = tmp
        }
        
        return newHead
    }
    
    
    func reverseList2(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
        
        let curr = head, next = curr?.next
        let newHead = reverseList2(next)
        
        next?.next = curr
        curr?.next = nil
        
        return newHead
    }
}
