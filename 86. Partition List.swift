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
        var head = head
        var leftHead = ListNode(0)
        let leftDummy = leftHead
        
        var rightHead = ListNode(0)
        let rightDummy = rightHead
        
        while head != nil {
            if head!.val < x {
                leftHead.next = head
                leftHead = leftHead.next!
            }else {
                rightHead.next = head
                rightHead = rightHead.next!
            }
            head = head?.next
        }
        
        leftHead.next = rightDummy.next
        rightHead.next = nil
        
        return leftDummy.next
    }
}
