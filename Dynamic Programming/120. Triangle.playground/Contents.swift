class MinimumTotal {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        guard triangle.count > 0, triangle[0].count > 0 else {
            return 0
        }
        var res = Array(repeating: Array(repeating: 0, count: triangle.count), count: triangle.count)
        for i in 0..<triangle.count {
            res[triangle.count - 1][i] = triangle[triangle.count - 1][i]
        }
        
        for i in (0..<triangle.count - 1).reversed() {
            for j in 0...i {
                res[i][j] = min(res[i + 1][j], res[i + 1][j + 1]) + triangle[i][j]
            }
        }
        return res[0][0]
    }
}
