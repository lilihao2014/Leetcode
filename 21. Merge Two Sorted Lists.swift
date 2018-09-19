//
//  21. Merge Two Sorted Lists.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/18.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class MergeTwoLists {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var dummy = ListNode(0), tail = dummy
        var l1 = l1, l2 = l2
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                tail.next = l1
                l1 = l1!.next
            }else {
                tail.next = l2
                l2 = l2!.next
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
}
