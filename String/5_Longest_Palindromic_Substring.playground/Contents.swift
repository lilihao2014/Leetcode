class Solution {
    func longestPalindrome(_ s: String) -> String {
        var res = String()
        let tmp = Array(s)
        for i in 0..<tmp.count {
            var left = i, right = i
            let str1 = findLongestPalindrome(tmp, left: &left, right: &right)
            res = str1.count > res.count ? str1 : res
            var newLeft = i, newRight = i + 1
            let str2 = findLongestPalindrome(tmp, left: &newLeft, right: &newRight)
            res = str2.count > res.count ? str2 : res
        }
        return res
    }
    
    func findLongestPalindrome(_ tmp: [Character], left: inout Int, right: inout Int) -> String {
        while left >= 0 && right < tmp.count && tmp[left] == tmp[right]{
            left -= 1
            right += 1
        }
        var res = String()
        for i in left + 1..<right - 1 {
            res.append(tmp[i])
        }
        return res
    }
}
