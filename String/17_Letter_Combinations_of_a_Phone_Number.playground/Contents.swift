class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        let numbersMap:[Character: String] = ["2": "abc", "3":"def", "4":"ghi", "5":"jkl", "6":"mno", "7": "pqrs", "8":"tuv", "9":"wxyz"]
        var res = [String]()
        var tmp = Array(digits)
        for i in 0..<tmp.count {
            let currentNumber = tmp[i]
            guard let values = numbersMap[currentNumber] else {
                return res
            }
            let valuesArray = Array(values)
            if i == 0 {
                for value in valuesArray {
                    res.append(String(value))
                }
            }else {
                while res.first!.count <= i {
                    let curr = res.removeFirst()
                    for value in valuesArray {
                        res.append(String(curr + String(value)))
                    }
                }
            }
        }
        return res
    }
}
