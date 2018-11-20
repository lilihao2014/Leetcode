//
//  155. Min Stack.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/20.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class MinStack {
    class ListNode {
        var value: Int
        var next: ListNode?
        init(_ value: Int) {
            self.value = value
        }
    }
    
    private var head = ListNode(0)
    private var minHead = ListNode(0)
    
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        let curr = ListNode(x)
        if let next = head.next, let minNext = minHead.next {
            curr.next = next
            head.next = curr
            let minValue = min(minNext.value, x)
            let minNode = ListNode(minValue)
            minNode.next = minNext
            minHead.next = minNode
        }else {
            head.next = curr
            minHead.next = curr
        }
    }
    
    func pop() {
        if let next = head.next, let minNext = minHead.next {
            head.next = next.next
            minHead.next = minNext.next
        }
    }
    
    func top() -> Int {
        return head.next?.value ?? -1
    }
    
    func getMin() -> Int {
        return minHead.next?.value ?? -1
    }
}
