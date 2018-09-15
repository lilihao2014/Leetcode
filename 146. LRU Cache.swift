//
//  146. LRU Cache.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/15.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class LRUCache {
    class Node {
        var key: Int
        var val: Int
        var prev: Node?
        var next: Node?
        init(_ key: Int, _ val: Int) {
            self.key = key
            self.val = val
        }
    }
    
    var map = [Int: Node]()
    var head = Node(-1, -1)
    var tail = Node(-1, -1)
    var capacity: Int
    
    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.prev = head
    }
    
    
    func get(key: Int) -> Int? {
        guard let curr = map[key] else { return nil }
        
        curr.prev?.next = curr.next
        curr.next?.prev = curr.prev
        moveToTail(node: curr)
        return curr.val
    }
    
    
    func set(key: Int, val: Int) {
        if map[key] != nil {
            let node = map[key]
            node?.val = val
            return
        }
        
        if map.count == capacity {
            if let firstNode = head.next {
                map[firstNode.key] = nil
                head.next = head.next?.next
                head.next?.prev = head
            }
        }
        
        let curr = Node(key, val)
        map[key] = curr
        moveToTail(node: curr)
    }
    
    
    private func moveToTail(node: Node) {
        node.prev = tail.prev
        tail.prev = node
        node.prev?.next = node
        node.next = tail
    }
}
