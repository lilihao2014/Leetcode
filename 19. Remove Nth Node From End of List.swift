//
//  19. Remove Nth Node From End of List.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/28.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class RemoveNthFromEnd {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var l1 = head, l2 = head
        for _ in 1..<n + 1 {
            l1 = l1?.next
        }
        guard l1 != nil else { return head?.next }
        while l1?.next != nil {
            l1 = l1?.next
            l2 = l2?.next
        }
        l2?.next = l2?.next?.next
        return head
    }
}
