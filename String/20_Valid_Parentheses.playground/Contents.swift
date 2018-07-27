class Solution {
    func isValid(_ s: String) -> Bool {
        let tmp = Array(s)
        var stack = [Character]()
        for char in tmp {
            if char == "(" || char == "[" || char == "{" {
                stack.insert(char, at: 0)
            }else if !stack.isEmpty && ((char == ")" && stack.first == "(") || (char == "}" && stack.first == "{") || (char == "]" && stack.first == "[")) {
                stack.removeFirst()
            }else {
                return false
            }
        }
        return stack.isEmpty
    }
}
