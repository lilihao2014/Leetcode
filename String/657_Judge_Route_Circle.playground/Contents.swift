class Solution {
    func judgeCircle(_ moves: String) -> Bool {
        var xDistance = 0, yDistance = 0
        let charArray = Array(moves)
        for c in charArray {
            if c == "U" {
                yDistance += 1
            }else if c == "D" {
                yDistance -= 1
            }else if c == "L" {
                xDistance -= 1
            }else if c == "R" {
                xDistance += 1
            }
        }
        return xDistance == 0 && yDistance == 0
    }
}
