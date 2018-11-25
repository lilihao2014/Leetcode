//
//  232. Implement Queue using Stacks.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/24.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class MyQueue {
    
    private var stack = [Int]()
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        var tmpStack = [Int]()
        while !stack.isEmpty {
            tmpStack.insert(stack.removeFirst(), at: 0)
        }
        stack.insert(x, at: 0)
        while !tmpStack.isEmpty {
            stack.insert(tmpStack.removeFirst(), at: 0)
        }
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        return stack.removeFirst()
    }
    
    /** Get the front element. */
    func peek() -> Int {
        return stack.first ?? -1
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return stack.isEmpty
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
 
