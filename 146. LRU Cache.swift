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
        var prev: Node?
        var next: Node?
        let key: Int
        var value: Int
        init(_ key: Int, _ value: Int) {
            self.key = key
            self.value = value
        }
    }
    
    private let head = Node(-1, -1)
    private let tail = Node(-1, -1)
    private let capacity: Int
    private var map = [Int: Node]()
    
    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.prev = head
    }
    
    func get(key: Int) -> Int? {
        guard let curr = map[key] else { return nil }
        
        curr.prev?.next = curr.next
        curr.next?.prev = curr.prev
        moveToTail(curr)
        return curr.value
    }
    
    func set(key: Int, val: Int) {
        if let preVal = get(key: key), preVal != val {
            let node = map[key]
            node?.value = val
            return
        }
        
        if map.count == capacity {
            if let node = head.next {
                head.next = head.next?.next
                head.next?.prev = head
                map[node.key] = nil
            }
        }
        
        let curr = Node(key, val)
        map[key] = curr
        moveToTail(curr)
    }
    
    private func moveToTail(_ node: Node) {
        node.prev = tail.prev
        tail.prev = node
        node.prev?.next = node
        node.next = tail
    }
}
