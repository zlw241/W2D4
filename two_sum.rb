

def bad_two_sum?(arr, target)
  arr[0...-1].each do |i|
    (i+1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target
    end
  end
  false
end

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false

def b_search(arr, target)
  return false if arr.empty?
  mid = arr / 2
  if arr[mid] == target
    true
  elsif arr[mid] < target
    b_search(arr[mid..-1], target)
  else
    b_search(arr[0...mid], target)
  end
end

def okay_two_sum?(arr, target)
  sorted_arr = arr.sort
  sorted_arr.each { |el| return true if b_search(arr, target-el) }
  false
end


def two_sum?(arr, target)
  two_sum_hash = Hash.new(0)
  arr.each do |el|
    return true if two_sum_hash[target-el] > 0
    two_sum_hash[el] += 1
  end
  false
end


arr = [0, 7, 5, 1]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false
