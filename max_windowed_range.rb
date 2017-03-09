


def max_windowed_range(arr, win)
  current_max_range = nil
  arr[0..(arr.length-win)].each_with_index do |el, i|
    window = arr[i...(i+win)]
    current_max_range ||= window.max - window.min
    if window.max - window.min > current_max_range
      current_max_range = window.max - window.min
    end
  end
  current_max_range
end

p max_windowed_range([1, 0, 2, 5, 4, 8], 2)
p max_windowed_range([1, 0, 2, 5, 4, 8], 3)
p max_windowed_range([1, 0, 2, 5, 4, 8], 4)
p max_windowed_range([1, 3, 2, 5, 4, 8], 5)
