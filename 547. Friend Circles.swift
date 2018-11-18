//
//  547. Friend Circles.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/11/18.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class FriendCircles {
    func findCircleNum1(_ M: [[Int]]) -> Int {
        var count = 0
        var visited = [Int](repeating: 0, count: M.count)
        for i in 0..<M.count {
            if visited[i] == 0 {
                dfs(&visited, i, M)
                count += 1
            }
        }
        return count
    }
    
    
    private func dfs(_ visited: inout [Int], _ i: Int, _ M: [[Int]]) {
        for j in 0..<M.count {
            if M[i][j] == 1 && visited[j] == 0 {
                visited[j] = 1
                dfs(&visited, j, M)
            }
        }
    }
    
    
    func findCircleNum2(_ M: [[Int]]) -> Int {
        var visited = [Int](repeating: 0, count: M.count)
        var count = 0
        var queue = [Int]()
        for i in 0..<M.count {
            if visited[i] == 0 {
                queue.append(i)
                while !queue.isEmpty {
                    let s = queue.removeFirst()
                    visited[s] = 1
                    for j in 0..<M.count {
                        if M[s][j] == 1 && visited[j] == 0 {
                            queue.append(j)
                        }
                    }
                }
                count += 1
            }
        }
        return count
    }
}
