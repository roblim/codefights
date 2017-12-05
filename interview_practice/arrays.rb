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

######

def firstNotRepeatingCharacter(s)
    result = Hash.new(0)
    s.each_char { |el| result[el] += 1 }
    result = result.select { |key, val| val == 1 }
    result.keys.length > 0 ? result.to_a[0][0] : "_"
end

######

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
   
def rotateImage(a)
   size = a.length
   (0...size / 2).each do |row|
      (row...size - row -1).each do |col|
         cycle(a, size, row, col)
      end
   end
   a
end

######

def sudoku2(grid)
    return false unless check_subgrids(grid)
    return false unless check_rows(grid)
    return false unless check_cols(grid)
    true
end

def check_three_grid(grid, row, col)
    result = Hash.new(0)
    (row...row + 3).each do |row|
        (col...col + 3).each do |col|
            result[grid[row][col].to_i] += 1
        end
    end
    result.select { |key, val| key > 0 }.values.all? { |val| val == 1 }
end

def check_subgrids(grid)
    coords = [[0,0], [0,3], [0, 6],
              [3,0], [3,3], [3,6],
              [6,0], [6,3], [6,6]]
    coords.each do |coord|
        return false unless check_three_grid(grid, coord[0], coord[1])
    end
    true
end

def check_rows(grid)
    grid.each do |row|
        result = Hash.new(0)
        row.each do |el|
            result[el.to_i] += 1
        end
        return false unless result.select { |key, val| key > 0 }.values.all? { |val| val == 1 }
    end
    true
end

def check_cols(grid)
    size = grid.length
    (0...size).each do |col|
        result = Hash.new(0)
        (0...size).each do |row|
            result[grid[row][col].to_i] += 1
        end
        return false unless result.select { |key, val| key > 0 }.values.all? { |val| val == 1 }
    end
    true
end

######

def isCryptSolution(crypt, solution)
   hash = to_sol_hash(solution)
   word1 = to_num_string(crypt[0], hash)
   return false if word1[0] == '0' && word1.length > 1
   word2 = to_num_string(crypt[1], hash)
   return false if word2[0] == '0' && word2.length > 1
   word3 = to_num_string(crypt[2], hash)
   return false if word3[0] == '0' && word3.length > 1
   sum = word1.to_i + word2.to_i
   sum == word3.to_i
end

def to_sol_hash(solution)
   result = {}
   solution.each do |arr|
      result[arr[0]] = arr[1]
   end
   result
end

def to_num_string(word, hash)
   word.chars.map { |char| hash[char] }.join('')
end

######
