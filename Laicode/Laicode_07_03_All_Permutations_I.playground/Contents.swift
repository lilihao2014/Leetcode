func permutations(_ set: String) -> [String] {
    var res = [String]()
    var list = Array(set)
    helper(0, &res, &list)
    return res
}

private func helper(_ index: Int, _ res: inout [String], _ list: inout [Character]) {
    if index == list.count {
        res.append(String(list))
        return
    }
    
    for i in index..<list.count {
        list.swapAt(i, index)
        helper(index + 1, &res, &list)
        list.swapAt(i, index)
    }
}
