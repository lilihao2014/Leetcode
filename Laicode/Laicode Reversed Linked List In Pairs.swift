//
//  Laicode Reversed Linked List In Pairs.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/8/21.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation



class ReverseInPairs {
    // Method 1: Recursion
    func reverseInPairs1(_ head: ListNode?) -> ListNode? {
        guard let head = head else {return nil}
        guard let next = head.next else {return head}
        
        let newHead = next
        head.next = reverseInPairs1(next.next)
        newHead.next = head
        return newHead
    }
    
    
    // Method 2: Iterative
    func reverseInPairs2(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var curr = dummy
        
        while curr.next != nil && curr.next?.next != nil {
            let next = curr.next?.next
            curr.next?.next = curr.next?.next?.next
            next?.next = curr.next
            curr.next = next
            curr = (curr.next?.next!)!
        }
        
        return dummy.next
    }
}
