class Solution {
    func common(_ A: [Int]?, _ B: [Int]?) -> [Int] {
        var res = [Int]()
        guard let A = A, let B = B else {
            return res
        }
        var map = [Int: Int]()
        for num in A {
            if let _ = map[num] {
                map[num] = map[num]! + 1
            }else {
                map[num] = 1
            }
        }
        for num in B {
            if let _ = map[num] {
                if map[num]! > 0 {
                    map[num] = map[num]! - 1
                    res.append(num)
                }
            }
        }
        
        return res
    }
}
