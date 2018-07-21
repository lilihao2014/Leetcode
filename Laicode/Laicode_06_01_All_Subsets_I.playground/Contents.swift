/*
     Given a set of characters represented by a String, return a list containing all subsets of the characters.
     
     Assumptions
     
     There are no duplicate characters in the original set.
     ​​Examples
     
     Set = "abc", all the subsets are [“”, “a”, “ab”, “abc”, “ac”, “b”, “bc”, “c”]
     Set = "", all the subsets are [""]
     Set = null, all the subsets are []
 */

class Solution {
    func subSets(_ set: String?) -> [String] {
        var res = [String]()
        guard let set = set else {
            return res
        }
        let charArray = Array(set)
        var string = String()
        helper(&res, &string, charArray, 0)
        return res
    }
    
    
    private func helper(_ res: inout [String], _ string: inout String, _ charArray: [Character], _ index: Int) {
        res.append(string)
        for i in index..<charArray.count {
            string.append(charArray[i])
            helper(&res, &string, charArray, i + 1)
            string.removeLast()
        }
    }
}
