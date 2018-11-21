//
//  142. Linked List Cycle II.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/20.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class DetectCycle {
    func detectCycle(head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return nil }
        
        let intersect = getCycleNode(head: head)
        if intersect == nil {
            return nil
        }
        
        var l1 = intersect
        var l2 = head
        while l1 != l2 {
            l1 = l1?.next
            l2 = l2?.next
        }
        
        return l1
    }
    
    
    private func getCycleNode(head: ListNode?) -> ListNode? {
        if head == nil { return nil }
        
        var slow = head, fast = head
        
        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            if fast == slow {
                return fast
            }
        }
        
        return nil
    }
    
    
}
