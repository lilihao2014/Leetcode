//
//  148. Sort List.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/24.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class SortList {
    func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
        
        let middle = findMiddle(head)
        let l2 = sortList(middle?.next)
        middle?.next = nil
        let l1 = sortList(head)
        return merge(l1, l2)
    }
    
    
    private func merge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil { return nil }

        var dummy = ListNode(0), tail = dummy
        var l1 = l1, l2 = l2
        
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                tail.next = l1
                l1 = l1?.next
            }else {
                tail.next = l2
                l2 = l2?.next
            }
            tail = tail.next!
        }
        if l1 != nil {
            tail.next = l1
        }else if l2 != nil {
            tail.next = l2
        }
        
        return dummy.next
    }
    
    
    private func findMiddle(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
        
        var slow = head, fast = head
        while  fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
}
