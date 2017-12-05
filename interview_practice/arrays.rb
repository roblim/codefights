def firstDuplicate(a)
    result = Hash.new { |hsh, key| hsh[key] = [] }
    a.each_with_index do |el, idx|
        result[el] << idx
    end
    result = result.select { |key, val| val.length > 1 }
    if result.keys.length > 0
        return result.to_a.sort_by { |el| el[1][1]}[0][0]
    else 
        return -1
    end
end

def firstNotRepeatingCharacter(s)
    result = Hash.new(0)
    s.each_char { |el| result[el] += 1 }
    result = result.select { |key, val| val == 1 }
    result.keys.length > 0 ? result.to_a[0][0] : "_"
end