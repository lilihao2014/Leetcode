//
//  695. Max Area of Island.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/22.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class MaxAreaOfIsland {
    func maxAreaOfIsland1(_ grid: [[Int]]) -> Int {
        var maxArea = 0
        guard grid.count > 0, grid[0].count > 0 else { return maxArea }
        var used = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
        
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == 1 && used[i][j] == false {
                    var currentCount = 0
                    let count = dfs(&used, grid, i, j, &currentCount)
                    maxArea = max(maxArea, count)
                }

            }
        }

        return maxArea
    }

    @discardableResult
    private func dfs(_ used: inout [[Bool]], _ grid: [[Int]], _ i: Int, _ j: Int, _ count: inout Int) -> Int {
        if i >= 0 && i < grid.count && j >= 0 && j < grid[0].count && grid[i][j] == 1 && used[i][j] == false {
            count += 1
            used[i][j] = true
            dfs(&used, grid, i - 1, j, &count)
            dfs(&used, grid, i + 1, j, &count)
            dfs(&used, grid, i, j - 1, &count)
            dfs(&used, grid, i, j + 1, &count)
        }
        return count
    }
    
    
    func maxAreaOfIsland2(_ grid: [[Int]]) -> Int {
        var maxArea = 0
        guard grid.count > 0, grid[0].count > 0 else { return maxArea }
        var queue = [[Int]]()
        var grid = grid
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == 1 {
                    queue.append([i, j])
                    grid[i][j] = 0
                    let count = bfs(&grid, queue: &queue)
                    maxArea = max(maxArea, count)
                }
            }
        }
        
        return maxArea
    }
    
    private let dc = [0, 0, -1, 1]
    private let dr = [-1, 1, 0, 0]
    
    private func bfs(_ grid: inout [[Int]], queue: inout [[Int]]) -> Int {
        var count = 1
        while !queue.isEmpty {
            let curr = queue.removeFirst()
            for i in 0..<4 {
                let rowIndex = dr[i] + curr[0]
                let columnIndex = dc[i] + curr[1]
                if rowIndex < 0 || rowIndex >= grid.count || columnIndex < 0 || columnIndex >= grid[0].count || grid[rowIndex][columnIndex] == 0 { continue }
                grid[rowIndex][columnIndex] = 0
                count += 1
                queue.append([rowIndex, columnIndex])
            }
        }
        return count
    }
    
}
