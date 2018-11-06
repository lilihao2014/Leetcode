//
//  328. Odd Even Linked List.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/5.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class OddEvenList {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
        
        var odd = head, even = head?.next, evenHead = head?.next
        while even != nil && even?.next != nil {
            odd?.next = even?.next
            odd = odd?.next
            even?.next = odd?.next
            even = even?.next
        }
        odd?.next = evenHead
        return head
    }
}
