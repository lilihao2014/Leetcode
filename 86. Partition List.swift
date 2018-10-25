//
//  86. Partition List.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/24.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class PartitionList {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let leftDummy = ListNode(0), rightDummy = ListNode(0)
        var left = leftDummy, right = rightDummy
        var head = head
        while head != nil {
            if head!.val < x {
                left.next = head
                left = left.next ?? ListNode(0)
            }else {
                right.next = head
                right = right.next ?? ListNode(0)
            }
            head = head!.next
        }
        right.next = nil
        left.next = rightDummy.next
        return leftDummy.next
    }
}
