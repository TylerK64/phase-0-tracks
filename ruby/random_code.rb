#5.6 Release 2
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



#5.5 Release 2 code
first_name = name.split(' ')[0]
    last_name = name.split(' ')[1]
    if first_name[0].is_lower?
      first_name.capitalize!
    end
    if last_name[0].is_lower?
      last_name.capitalize!
    end
    name = first_name + " " + last_name