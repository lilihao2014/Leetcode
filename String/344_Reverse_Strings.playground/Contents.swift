class Solution {
    func reverseString(_ s: String) -> String {
        return String(s.reversed())
    }
    
    func reverseString1(_ s: String) -> String {
        var sArray = Array(s)
        var i = 0, j = s.count - 1
        while i < j {
            sArray.swapAt(i, j)
            i += 1
            j -= 1
        }
        return String(sArray)
    }
    
}
