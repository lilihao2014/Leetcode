class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var res = String()
        var carry = 0
        var newA = Array(a)
        var newB = Array(b)
        while newA.count != newB.count {
            if newA.count > newB.count {
                newB.insert("0", at: 0)
            }else {
                newA.insert("0", at: 0)
            }
        }
        for i in (0..<newA.count).reversed() {
            let num = Int(String(newA[i]))! + Int(String(newB[i]))! + carry
            res = String(num % 2) + res
            carry = num / 2
        }
        if carry == 1 {
            res = String(1) + res
        }
        return res
    }
}
