public class ListNode {
    var next: ListNode?
    var value: Int?
    init(_ value: Int) {
        self.value = value;
        self.next = nil
    }
}


func reverseList(_ head: ListNode?) -> ListNode? {
    guard let head = head else {
        return nil
    }
    guard let next = head.next else {
        return head
    }
    let newHead = reverseList(next)
    next.next = head
    head.next = nil
    return newHead
}


func reverseList2(_ head: ListNode?) -> ListNode? {
    var curr = head
    var first: ListNode?
    
    while curr != nil {
        let tmp = curr
        curr = curr!.next
        tmp!.next = first
        first = tmp
    }
    return first
}
