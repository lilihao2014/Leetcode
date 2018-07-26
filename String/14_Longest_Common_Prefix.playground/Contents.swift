class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var s = String()
        guard strs.count > 0 else {
            return s
        }
        for i in 0..<strs[0].count {
            for j in 0..<strs.count {
                if i == strs[j].count || strs[j][strs[j].index(strs[j].startIndex, offsetBy: i)] != strs[0][strs[0].index(strs[0].startIndex, offsetBy: i)]{
                    return s
                }
            }
            s.append(strs[0][strs[0].index(strs[0].startIndex, offsetBy: i)])
        }
        return s
    }
}
