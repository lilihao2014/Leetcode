/*
     Remove adjacent, repeated characters in a given string, leaving only one character for each group of such characters.
 
     Assumptions
 
     Try to do it in place.
     Examples
 
     “aaaabbbc” is transferred to “abc”
     Corner Cases
 
     If the given string is null, we do not need to do anything.
 */
class Solution {
    func deDup(_ input: String?) -> String? {
        guard let input = input else {
            return nil
        }
        guard input.count >= 2 else {
            return input
        }
        
        var end = 0;
        var charArray = Array(input)
        for i in 1..<charArray.count {
            if charArray[i] != charArray[end] {
                charArray[end + 1] = charArray[i];
                end += 1
            }
        }
        var res = String()
        for i in 0...end {
            res.append(charArray[i])
        }
        return res
    }
}
