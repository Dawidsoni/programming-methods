class ArraySort
  def self.insert_sort(array_list)
    for i in (1..(array_list.length() - 1))
      for j in (0..(i - 1)).reverse_each()
        if array_list.get(j) > array_list.get(j + 1)
          array_list.swap(j, j + 1)
        end
      end
    end
  end

  def self.partition(array_list, from_ind, to_ind)
    pivot = array_list.get(to_ind)
    less_ind = from_ind
    for i in (from_ind..(to_ind - 1))
      if array_list.get(i) < pivot
        array_list.swap(i, less_ind)
        less_ind += 1
      end
    end
    array_list.swap(less_ind, to_ind)
    return less_ind
  end

  def self.quick_sort(array_list, from_ind = 0, to_ind = array_list.length() - 1)
    if from_ind >= to_ind
      return
    end
    p_ind = partition(array_list, from_ind, to_ind)
    quick_sort(array_list, from_ind, p_ind - 1)
    quick_sort(array_list, p_ind + 1, to_ind)
  end

end
