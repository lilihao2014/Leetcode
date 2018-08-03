class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        var numsArray = Array(repeating: 0, count: num1.count + num2.count)
        var num1Array = Array(num1)
        var num2Array = Array(num2)
        for i in (0..<num1Array.count).reversed() {
            for j in (0..<num2Array.count).reversed() {
                if let n1 = Int(String(num1Array[i])), let n2 = Int(String(num2Array[j])) {
                    numsArray[i + j + 1] += n1 * n2
                }
            }
        }
        
        var carry = 0
        for i in (0..<numsArray.count).reversed() {
            let tmp = numsArray[i]
            numsArray[i] = (tmp + carry) % 10
            carry = (tmp + carry) / 10
        }
        
        var res = String()
        
        var zeroInFront = false
        if numsArray[0] == 0 {
            numsArray[0] = -1
            zeroInFront = true
        }else {
            res += String(numsArray[0])
        }
        
        for i in 1..<numsArray.count {
            if zeroInFront == true && numsArray[i - 1] == -1 && numsArray[i] == 0 {
                numsArray[i] = -1
                continue
            }
            zeroInFront = false
            res += String(numsArray[i])
        }
        return res.count == 0 ? "0" : res
    }
}
