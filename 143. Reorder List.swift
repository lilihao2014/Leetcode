//
//  143. Reorder List.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/20.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class ReorderList {
    func reorderList(_ head: ListNode?) {
        if head == nil || head?.next == nil { return }
        
        let middle = findMiddle(head)
        var l2 = middle?.next
        middle?.next = nil
        l2 = reverseLinkedList(l2)
        mergeList(head, l2)
    }
    
    
    private func findMiddle(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var slow = head, fast = head
        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
    
    
    private func reverseLinkedList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var head = head
        var newHead: ListNode?
        while head != nil {
            let tmp = head
            head = head?.next
            tmp?.next = newHead
            newHead = tmp
        }
        return newHead
    }
    
    @discardableResult
    private func mergeList(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil { return l2 }
        else if l2 == nil { return l1 }
        
        let dummy = ListNode(0)
        var tail = dummy
        var l1 = l1, l2 = l2
        
        while l1 != nil && l2 != nil {
            tail.next = l1
            l1 = l1?.next
            tail.next?.next = l2
            l2 = l2?.next
            tail = tail.next!.next!
        }
        if l1 != nil {
            tail.next = l1
        }else if l2 != nil {
            tail.next = l2
        }
        return dummy.next
    }
}
