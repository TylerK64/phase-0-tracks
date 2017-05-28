class TodoList
  def initialize(arr)
    @arr = arr
  end

  def get_items
    @arr.each {|x| x}
  end

  def add_item(str)
    @arr << str
  end

  def delete_item(str)
    if !@arr.include?(str)
      puts "List does not contain string, try again."
    end

    @arr.delete_if {|x| x == str}    
  end

  def get_item(int)
    if int >= @arr.length
      puts "Index doesn't exist, try again."
    else
      @arr[int]
    end
  end
end

#list = TodoList.new(["list item 1", "list item 2"])
#list.delete_item("list item 1")