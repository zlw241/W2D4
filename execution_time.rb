
# O(n**2)
def my_min_phase_i(arr)
  arr.each do |el1|
    count_smaller = 0
    arr.each do |el2|
      if el2 > el1
        count_smaller += 1
      end
    end
    return el1 if count_smaller == arr.length-1
  end
end

# O(n)
def my_min_phase_ii(arr)
  min = arr[0]
  arr.each { |el| min = el if el < min}
  min
end

def contiguous_sub_sum(list)
  subs = []
  list.each_index do |i|
    (i..list.length-1).each do |j|
      subs << list[i..j]
    end
  end
  subs.max_by { |sub| sub.inject(&:+) }.inject(&:+)
end


def contiguous_sub_sum2(list)
  largest_seen = 0
  sum = 0
  list.each do |el|
    sum + el < 0 ? sum = 0 : sum += el
    largest_seen = sum if sum > largest_seen
  end
  largest_seen
end





arr = [4,5,6,7,8,9,0,3,2,1,4,5,33,555]
p my_min_phase_i(arr)
p my_min_phase_ii(arr)

list = [2, 3, -6, 7, -6, 7]
list2 = [-5, -1, -3]
p contiguous_sub_sum(list)
p contiguous_sub_sum(list2)
