//
//  2. Add Two Numbers.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/13.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class AddTwoNumbers {
    class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var carry = 0
        var dummy = ListNode(0), tail = dummy
        var newL1 = l1, newL2 = l2
        while newL1 != nil || newL2 != nil || carry != 0 {
            let val1 = newL1 == nil ? 0 : newL1!.val
            let val2 = newL2 == nil ? 0 : newL2!.val
            let sum = val1 + val2 + carry
            let curr = ListNode(sum % 10)
            carry = sum / 10
            tail.next = curr
            tail = tail.next!
            if newL1 != nil {
                newL1 = newL1!.next
            }
            if newL2 != nil {
                newL2 = newL2!.next
            }
        }
        return dummy.next
    }
}
