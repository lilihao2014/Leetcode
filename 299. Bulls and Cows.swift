//
//  299. Bulls and Cows.swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2019/1/20.
//  Copyright © 2019 Lihao Li. All rights reserved.
//

import Foundation

class GetHint {
    func getHint(_ secret: String, _ guess: String) -> String {
        var bulls = 0, cows = 0
        let secretArray = Array(secret), guessArray = Array(guess)
        var countArray = Array(repeating: 0, count: 10)
        
        for i in 0..<secretArray.count {
            if secretArray[i] == guessArray[i] {
                bulls += 1
            }else {
                if let secretValue = Int(String(secretArray[i])), let guessValue = Int(String(guessArray[i])) {
                    if countArray[secretValue] > 0 {
                        cows += 1
                    }
                    if countArray[guessValue] < 0 {
                        cows += 1
                    }
                    countArray[secretValue] -= 1
                    countArray[guessValue] += 1
                }
            }
        }
        
        return "\(bulls)A\(cows)B"
    }
}
