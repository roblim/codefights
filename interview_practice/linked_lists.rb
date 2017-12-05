######

# Definition for singly-linked list:
# class ListNode
#   attr_accessor :value, :next
#   def initialize(val)
#     @value = val
#     @next = nil
# end
#
def removeKFromList(l, k)
    return nil unless l
    first = l
    while first.value == k
        first = first.next
        return nil unless first
    end
    previous = first
    current = first.next
    while current
        if current.value == k
            previous.next = current.next
            current = current.next
        else 
            previous = current
            current = current.next
        end
    end
    first
end

######

# Definition for singly-linked list:
# class ListNode
#   attr_accessor :value, :next
#   def initialize(val)
#     @value = val
#     @next = nil
# end
#
def isListPalindrome(l)
    return true if l.nil?
    result = [l.value]
    next_node = l.next
    while next_node
        result << next_node.value
        next_node = next_node.next
    end
    result == result.reverse
end

######

def addTwoHugeNumbers(a, b)
    result = get_num_string(a).to_i + get_num_string(b).to_i
    generate_result(result)
end

def get_num_string(node)
    num_string = ""
    num_string += node.value.to_s.rjust(4, '0')
    next_node = node.next
    while next_node
        num_string += next_node.value.to_s.rjust(4, '0')
        next_node = next_node.next
    end
    num_string
end

def generate_result(number)
    result = []
    num_chars = number.to_s.chars
    temp = []
    until num_chars.empty?
        temp.unshift(num_chars.pop)
        if temp.length == 4
            result.unshift(temp.join(''))
            temp = []
        end
    end
    result.unshift(temp.join('')) unless temp.empty? 
    list = []
    result.map! { |el| ListNode.new(el.to_i) }
    result.each_with_index do |el, idx|
        el.next = result[idx + 1] if idx < result.length
    end
    result[0]
end

######