//
//  50. Pow(x, n).swift
//  LeetCode_Swift
//
//  Created by Lihao Li on 2018/9/24.
//  Copyright © 2018 Lihao Li. All rights reserved.
//

import Foundation

class MyPow {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if x == 0 { return 0 }
        if x == 1 { return 1 }
        
        if n % 2 == 0 {
            return myPow(x * x, n / 2)
        }else {
            if n > 0 {
                return myPow(x * x, n / 2) * x
            }else {
                return myPow(x * x, n / 2) / x
            }
        }
    }
}
