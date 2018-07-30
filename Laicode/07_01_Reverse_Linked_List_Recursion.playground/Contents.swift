public class ListNode {
    var next: ListNode?
    var value: Int?
    init(_ value: Int) {
        self.value = value;
        self.next = nil
    }
}

func reverseLinkedList(_ head: ListNode?) -> ListNode? {
    guard let head = head else {
        return nil
    }
    guard let next = head.next else {
        return head
    }
    let newHead = reverseLinkedList(next)
    next.next = head
    head.next = nil
    return newHead
}
