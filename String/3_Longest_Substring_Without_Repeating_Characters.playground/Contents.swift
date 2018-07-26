class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var map = [Character: Int]()
        let charArray = Array(s)
        var start = 0, maxLength = 0
        for i in 0..<charArray.count {
            if map.keys.contains(charArray[i]) {
                let lastSeen = map[charArray[i]]!
                if lastSeen >= start {
                    maxLength = max(maxLength, i - start)
                    start = lastSeen + 1
                }
            }
            map[charArray[i]] = i
        }
        maxLength = max(maxLength, charArray.count - start)
        return maxLength
    }
}
