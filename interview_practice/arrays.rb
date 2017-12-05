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