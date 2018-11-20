//
//  203. Remove Linked List Elements.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/20.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class RemoveElements {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var head = head
        while head != nil && head!.val == val {
            head = head?.next
        }
        guard var newHead = head else { return nil }
        
        let dummy = newHead
        while newHead.next != nil {
            if newHead.next!.val == val {
                newHead.next = newHead.next!.next
            }else {
                newHead = newHead.next!
            }
        }
        return dummy
    }
}
