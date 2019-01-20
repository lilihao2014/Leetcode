//
//  947. Most Stones Removed with Same Row or Column.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2019/1/20.
//  Copyright © 2019 Lihao Li. All rights reserved.
//

import Foundation

class RemoveStones {
    class DSU {
        var parent: [Int]
        
        
        init(N: Int) {
            parent = Array(repeating: 0, count: N)
            for i in 0..<N {
                parent[i] = i
            }
        }
        
        
        func find(_ x: Int) -> Int {
            if parent[x] != x {
                parent[x] = find(parent[x])
            }
            return parent[x]
        }
        
        func union(_ x: Int, _ y: Int) {
            parent[find(x)] = find(y)
        }
    }
    
    
    func removeStones(_ stones: [[Int]]) -> Int {
        let N = stones.count
        let dsu = DSU(N: 20000)
        var seen = Set<Int>()
        
        for stone in stones {
            dsu.union(stone[0], stone[1] + 10000)    
        }
        
        for stone in stones {
            seen.insert(dsu.find(stone[0]))
        }
        
        return N - seen.count
    }
}
