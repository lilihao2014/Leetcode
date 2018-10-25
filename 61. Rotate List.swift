//
//  61. Rotate List.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/10/24.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation


class RotateRight {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let head = head else { return nil }
        if k == 0 { return head }
        
        var tail = head
        var count = 1
        while tail.next != nil {
            tail = tail.next!
            count += 1
        }
        
        let k = k % count
        if k == 0 { return head }
        
        var dummy = head
        var step = count - k - 1
        while step > 0 && dummy.next != nil {
            dummy = dummy.next!
            step -= 1
        }
        let newHead = dummy.next
        tail.next = head
        dummy.next = nil
        return newHead
    }
}
