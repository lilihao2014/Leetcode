class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var res = [[String]]()
        var dict = [String:[String]]()
        for str in strs {
            var charArray = Array(str)
            charArray.sort(){$0 < $1}
            let key = String(charArray)
            if dict.keys.contains(key) {
                dict[key]?.append(str)
            }else {
                dict[key] = [str]
            }
        }
        for key in dict.keys {
            res.append(dict[key]!)
        }
        return res
    }
}
