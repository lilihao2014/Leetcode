class Solution {
    func reverseWords(_ s: String) -> String {
        var charArray = Array(s)
        var leftIndex = 0
        for i in 0...charArray.count {
            if i == charArray.count || charArray[i] == " " {
                reverse(&charArray, leftIndex, i - 1)
                leftIndex = i + 1
            }
        }
        return String(charArray)
    }
    
    private func reverse(_ charArray: inout [Character], _ i: Int, _ j: Int) {
        var left = i, right = j
        while left < right {
            charArray.swapAt(left, right)
            left += 1
            right -= 1
        }
        
    }
}
