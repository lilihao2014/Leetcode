//
//  160. Intersection of Two Linked Lists.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/22.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class GetIntersectionNode {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var countA = 0, countB = 0
        
        var p = headA
        while p != nil {
            p = p?.next
            countA += 1
        }
        
        var q = headB
        while q != nil {
            q = q?.next
            countB += 1
        }
        
        p = headA
        q = headB
        if countA > countB {
            for _ in 1..<countA - countB + 1 {
                p = p?.next
            }
        }else {
            for _ in 1..<countB - countA + 1 {
                q = q?.next
            }
        }
        
        while p != nil && q != nil && p != q {
            p = p?.next
            q = q?.next
        }
        
        return p
    }
}
