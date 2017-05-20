def bubble_sort(array)
  return if array.length <= 1
  swapped = true
  while swapped do
    swapped = false
    0.upto(array.length-2) do |x|
      if array[x] > array[x+1]
        a = array[x]
        array[x] = array[x+1]
        array[x+1] = a
        swapped = true
      end
    end
  end
  array
end

a = [5,4,3,2,1]

#ignore for now, saving for later