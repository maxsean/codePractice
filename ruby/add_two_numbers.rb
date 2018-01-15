# You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

# You may assume the two numbers do not contain any leading zero, except the number 0 itself.

class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

def add_two_numbers(l1, l2)
    prehead = ListNode.new(-1)
    current = prehead
    carry = 0

    while l1 || l2 do
        l1 != nil ? x = l1.val : x = 0
        l2 != nil ? y = l2.val : y = 0
        sum = carry + x + y
        current.next = ListNode.new(sum%10)
        current = current.next
        carry = sum/10
        l1 = l1.next if l1 != nil
        l2 = l2.next if l2 != nil
    end
    if carry > 0
        current.next = ListNode.new(carry)
    end
    prehead.next
end
