/*
     Given a string with no duplicate characters, return a list with all permutations of the characters.
     
     Examples
     
     Set = “abc”, all permutations are [“abc”, “acb”, “bac”, “bca”, “cab”, “cba”]
     Set = "", all permutations are [""]
     Set = null, all permutations are []
 */
class Solution {
    func permutations(_ set: String?) -> [String] {
        var res = [String]()
        guard let set = set else {
            return res
        }
        var charArray = Array(set)
        helper(&charArray, 0, &res)
        return res
    }
    
    func helper(_ charArray: inout [Character], _ index: Int, _ res: inout [String]) {
        if index == charArray.count {
            res.append(String(charArray))
            return
        }
        for i in index..<charArray.count {
            swap(&charArray, index, i)
            helper(&charArray, index + 1, &res)
            swap(&charArray, index, i)
        }
    }
    
    func swap(_ charArray: inout [Character], _ left: Int, _ right: Int) {
        let tmp = charArray[left]
        charArray[left] = charArray[right]
        charArray[right] = tmp
    }
    
}
