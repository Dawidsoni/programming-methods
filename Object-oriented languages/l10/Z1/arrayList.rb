class ArrayList
  def initialize()
    @el_counter = 0
    @el_list = Array.new(1)
  end

  def resize_list()
    el_list_copy = @el_list
    @el_list = Array.new(el_list_copy.size() * 2)
    for i in (0..(el_list_copy.size() - 1))
      @el_list[i] = el_list_copy[i]
    end
  end

  def push(el_val)
    @el_list[@el_counter] = el_val
    @el_counter += 1
    if @el_counter == @el_list.size()
      resize_list()
    end
  end

  def get(el)
    return @el_list[el]
  end

  def length()
    return @el_counter
  end

  def swap(i, j)
    @el_list[i], @el_list[j] = @el_list[j], @el_list[i]
  end

end
