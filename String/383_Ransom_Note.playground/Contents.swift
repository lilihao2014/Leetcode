class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var dict = [String: Int]()
        let magazineArray = Array(magazine)
        for i in 0..<magazineArray.count {
            if let count = dict[String(magazineArray[i])] {
                dict[String(magazineArray[i])] = count + 1
            }else {
                dict[String(magazineArray[i])] = 1
            }
        }
        let ransomNoteArray = Array(ransomNote)
        for i in 0..<ransomNoteArray.count {
            let count = dict[String(ransomNoteArray[i])]
            guard count != nil && count! > 0 else {
                return false
            }
            dict[String(ransomNoteArray[i])] = count! - 1
        }
        return true
    }
}
