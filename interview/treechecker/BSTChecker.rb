def validateTree(tree)
  return 0,0,true if tree.nil?
  min = max = value = tree[0]
  left = tree[1]
  right = tree[2]
  validL = validR = true

  if !left.nil?
    minL, maxL, validL = validateTree(left)
    min = minL if minL < min
    max = maxL if maxL > max
  end

  if !right.nil?
    minR, maxR, validR = validateTree(right)
    max = maxR if maxR > max
    min = minR if minR < min
  end

  puts "#{min},#{max},#{value}"
  puts "min<value: #{min<=value}"
  puts "value<max: #{value<=max}"
  return min, max, min <= value && value <= max && validL && validR
end
