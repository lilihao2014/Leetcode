class Solution {
    func reverseWords(_ s: String) -> String {
        var arr = s.split(separator: " ")
        var i = 0, j = arr.count - 1
        while i < j {
            arr.swapAt(i, j)
            i += 1
            j -= 1
        }
        var res = String()
        for i in 0..<arr.count {
            res += arr[i]
            if i != arr.count - 1 {
                res += " "
            }
        }
        return res
    }
}
