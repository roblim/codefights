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

######
def rotateImage(a)
   size = a.length
   hold = nil
   a.each_with_index do |row, row_idx|
      row.each_with_index do |el, col_idx|
         new_loc = new_coord(size, row_idx, col_idx)
         hold =
end

def new_coord(n, r, c)
   [c, n - r - 1] 
end
      
def cycle(arr, n, row, col)
   count = 0
   new_pos = new_coord(n, row, col)
   hold = arr[row][col]
   while count < 4
      hold, arr[new_pos[0]][new_pos[1]] = arr[new_pos[0]][new_pos[1]], hold
      new_pos = new_coord(n, new_pos[0], new_pos[1])
      count += 1
   end
   arr
end

######