class NumSquares {
    func numSquares(_ n: Int) -> Int {
        guard n > 0 else {
            return 0
        }
        var res = Array(repeating: 0, count: n + 1)
        for i in 1..<res.count {
            res[i] = i
            var j = 1
            while j * j <= i {
                res[i] = min(res[i], res[i - j * j] + 1)
                j += 1
            }
        }
        return res[n]
    }
}
