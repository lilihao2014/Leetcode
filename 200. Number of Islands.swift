//
//  200. Number of Islands.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/15.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class NumIslands {
    //DFS: time complexity: O(m * n) sapce complexity: O(m * n)
    func numIslands1(_ grid: [[Character]]) -> Int {
        guard grid.count > 0 && grid[0].count > 0 else { return 0 }
        
        let rows = grid.count, columns = grid[0].count
        var used = Array(repeating: Array(repeating: false, count: columns), count: rows)
        var islandCount = 0
        for i in 0..<rows {
            for j in 0..<columns {
                if used[i][j] == false && grid[i][j] == "1" {
                    islandCount += 1
                    dfsIslands(used: &used, grid: grid, i: i, j: j)
                }
            }
        }
        return islandCount
    }
    
    private func dfsIslands(used: inout [[Bool]], grid: [[Character]], i: Int, j: Int) {
        if i >= 0 && i < grid.count && j >= 0 && j < grid[0].count && grid[i][j] == "1" && !used[i][j] {
            used[i][j] = true
            dfsIslands(used: &used, grid: grid, i: i + 1, j: j)
            dfsIslands(used: &used, grid: grid, i: i - 1, j: j)
            dfsIslands(used: &used, grid: grid, i: i, j: j + 1)
            dfsIslands(used: &used, grid: grid, i: i, j: j - 1)
        }
    }
    
    
    //BFS:
    //Time complexity : O(M \times N)O(M×N) where MM is the number of rows and NN is the number of columns.
    //Space complexity : O(min(M, N)) because in worst case where the grid is filled with lands, the size of queue can grow up to min(M,N).
    func numIslands2(_ grid: [[Character]]) -> Int {
        guard grid.count > 0 , grid[0].count > 0 else { return 0 }
        
        var gridCopy = grid
        let rows = gridCopy.count, columns = gridCopy[0].count
        var queue = [[Int]]()
        var islandCount = 0
        for i in 0..<rows {
            for j in 0..<columns {
                if gridCopy[i][j] == "1" {
                    queue.append([i, j])
                    gridCopy[i][j] = "0"
                    bfs(grid: &gridCopy, queue: &queue)
                    islandCount += 1
                }
            }
        }
        return islandCount
    }
    
    let dr = [0, 0, -1, 1]
    let dc = [1, -1, 0, 0]
    
    private func bfs(grid: inout [[Character]], queue: inout [[Int]]) {
        while !queue.isEmpty {
            let curr = queue.removeFirst()
            for i in 0..<4 {
                let rowIndex = dr[i] + curr[0]
                let columnIndex = dc[i] + curr[1]
                if rowIndex < 0 || rowIndex >= grid.count || columnIndex < 0 || columnIndex >= grid[0].count || grid[rowIndex][columnIndex] == "0" { continue }
                grid[rowIndex][columnIndex] = "0"
                queue.append([rowIndex, columnIndex])
            }
        }
    }
    
    
}
