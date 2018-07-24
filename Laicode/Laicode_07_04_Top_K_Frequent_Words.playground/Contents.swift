/*
     Given a composition with different kinds of words, return a list of the top K most frequent words in the composition.
 
     Assumptions
 
     the composition is not null and is not guaranteed to be sorted
     K >= 1 and K could be larger than the number of distinct words in the composition, in this case, just return all the distinct words
     Return
 
     a list of words ordered from most frequent one to least frequent one (the list could be of size K or smaller than K)
     Examples
 
     Composition = ["a", "a", "b", "b", "b", "b", "c", "c", "c", "d"], top 2 frequent words are [“b”, “c”]
     Composition = ["a", "a", "b", "b", "b", "b", "c", "c", "c", "d"], top 4 frequent words are [“b”, “c”, "a", "d"]
     Composition = ["a", "a", "b", "b", "b", "b", "c", "c", "c", "d"], top 5 frequent words are [“b”, “c”, "a", "d"]
 */
struct PriorityQueue<Element> {
    var elements: [Element]
    var priorityFunction: (Element, Element) -> Bool
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var size: Int {
        return elements.count
    }
    
    init(elements: [Element], priorityFunction: @escaping(Element, Element) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
        buildHeap()
    }
    
    mutating func buildHeap() {
        for index in (0..<size / 2).reversed() {
            percolateDown(elementAtIndex: index)
        }
    }
    
    func peek() -> Element? {
        return elements.first
    }
    
    func isRoot(_ index: Int) -> Bool {
        return index == 0
    }
    
    func leftChildIndex(of index: Int) -> Int {
        return 2 * index + 1
    }
    
    func rightChildIndex(of index: Int) -> Int {
        return 2 * index + 2
    }
    
    func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFunction(elements[firstIndex], elements[secondIndex])
    }
    
    func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        guard childIndex < size && isHigherPriority(at: childIndex, than: parentIndex) else {
            return parentIndex
        }
        return childIndex
    }
    
    func highestPriorityIndex(for parent: Int) -> Int {
        return highestPriorityIndex(of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent)), and: rightChildIndex(of: parent))
    }
    
    mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
        guard firstIndex != secondIndex else {
            return
        }
        elements.swapAt(firstIndex, secondIndex)
    }
    
    mutating func enqueue(_ element: Element) {
        elements.append(element)
        percolateUp(elementAtIndex: size - 1)
    }
    
    mutating func percolateUp(elementAtIndex index: Int) {
        let parent = parentIndex(of: index)
        guard !isRoot(index), isHigherPriority(at: index, than: parent) else {
            return
        }
        swapElement(at: index, with: parent)
        percolateUp(elementAtIndex: parent)
    }
    
    mutating func dequeue() -> Element? {
        guard !isEmpty else {
            return nil
        }
        swapElement(at: 0, with: size - 1)
        let element = elements.removeLast()
        if !isEmpty {
            percolateDown(elementAtIndex: 0)
        }
        return element
    }
    
    mutating func percolateDown(elementAtIndex index: Int) {
        let childIndex = highestPriorityIndex(for: index)
        if index == childIndex {
            return
        }
        swapElement(at: index, with: childIndex)
        percolateDown(elementAtIndex: childIndex)
    }
}

class Solution {
    class Entry {
        var count: Int
        var string: String
        init(_ string: String, _ count: Int) {
            self.string = string
            self.count = count
        }
    }
    
    func topKFrequent(_ combo: [String]?, _ k: Int) -> [String] {
        var res = [String]()
        guard let combo = combo else {
            return res
        }
        var map = [String: Int]()
        for s in combo {
            if let _ = map[s] {
                map[s] = map[s]! + 1
            }else {
                map[s] = 1
            }
        }
        
        var tmp = [Entry]()
        for (string, count) in map {
            let entry = Entry(string, count)
            tmp.append(entry)
        }
        
        var maxHeap = PriorityQueue<Entry>(elements: tmp) { (e1, e2) -> Bool in
            return e1.count > e2.count
        }
        
        let size = min(k, maxHeap.size)
        for _ in 0..<size {
            res.append((maxHeap.dequeue()?.string)!)
        }

        return res
    }
}



