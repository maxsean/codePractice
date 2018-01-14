# Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.

class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

def merge_two_lists(l1, l2)
    output = ListNode.new(-1)
    prev = output
    while l1 && l2
        if l1.val <= l2.val
            prev.next = l1
            l1 = l1.next
        else
            prev.next = l2
            l2 = l2.next
        end
        prev = prev.next
    end
    if l1 != nil
        prev.next = l1
    else
        prev.next = l2
    end
    return output.next
end
