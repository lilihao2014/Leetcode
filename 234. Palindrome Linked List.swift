//
//  234. Palindrome Linked List.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/3.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class IsPalindromeLinkedList {
    func isPalindrome(_ head: ListNode?) -> Bool {
        guard head != nil, head?.next != nil else { return true }
        
        let middle = findMiddle(head)
        var h2 = reverseLinkedList(middle?.next)
        middle?.next = nil
        var h1 = head
        while h1 != nil && h2 != nil {
            if h1?.val != h2?.val { return false }
            h1 = h1?.next
            h2 = h2?.next
        }
        return true
    }
    
    
    private func findMiddle(_ head: ListNode?) -> ListNode? {
        guard head != nil, head?.next != nil else { return nil }
        var slow = head, fast = head
        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
    
    
    private func reverseLinkedList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
        var newHead: ListNode?
        var curr = head
        while curr != nil {
            let tmp = curr
            curr = curr?.next
            curr?.next = tmp
            newHead = tmp
        }
        return newHead
    }
}
