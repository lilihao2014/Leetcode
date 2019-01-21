//
//  399. Evaluate Division.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2019/1/20.
//  Copyright © 2019 Lihao Li. All rights reserved.
//

import Foundation

class CalcEquation {
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var pairsDict = [String: [String]]()
        var valuesDict = [String: [Double]]()
        
        for i in 0..<equations.count {
            if var letters = pairsDict[equations[i][0]] {
                letters.append(equations[i][1])
                pairsDict[equations[i][0]] = letters
            }else {
                pairsDict[equations[i][0]] = [equations[i][1]]
                
            }
            
            if var letters = pairsDict[equations[i][1]] {
                letters.append(equations[i][0])
                pairsDict[equations[i][1]] = letters
            }else {
                pairsDict[equations[i][1]] = [equations[i][0]]
                
            }
            
            if var valuesArray = valuesDict[equations[i][0]] {
                valuesArray.append(values[i])
                valuesDict[equations[i][0]] = valuesArray
            }else {
                valuesDict[equations[i][0]] = [values[i]]
            }
            
            if var valuesArray = valuesDict[equations[i][1]] {
                valuesArray.append(1 / values[i])
                valuesDict[equations[i][1]] = valuesArray
            }else {
                valuesDict[equations[i][1]] = [1 / values[i]]
            }
        }
        
        var res = Array(repeating: 0.0, count: queries.count)
        for i in 0..<res.count {
            let query = queries[i]
            var set = Set<String>()
            res[i] = dfs(query[0], query[1], pairsDict, valuesDict, &set, 1.0)
            if res[i] == 0.0 { res[i] = -1.0 }
        }
        
        return res
    }
    
    
    private func dfs(_ start: String, _ end: String, _ pairs: [String: [String]], _ values: [String: [Double]], _ set: inout Set<String>, _ value: Double) -> Double {
        if set.contains(start) { return 0.0 }
        if !pairs.keys.contains(start) { return 0.0 }
        if start == end { return value }
        
        set.insert(start)
        var tmp = 0.0
        if let strList = pairs[start], let valueList = values[start] {
            for i in 0..<strList.count {
                tmp = dfs(strList[i], end, pairs, values, &set, value * valueList[i])
                if tmp != 0.0 {
                    break
                }
            }
        }
        
        set.remove(start)
        return tmp
    }
}
