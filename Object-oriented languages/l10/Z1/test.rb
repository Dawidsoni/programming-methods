require_relative("arrayList")
require_relative("ArraySort")

def get_sample_list()
  num_list = ArrayList.new()
  num_list.push(3)
  num_list.push(2)
  num_list.push(1)
  num_list.push(5)
  num_list.push(4)
  num_list.push(8)
  num_list.push(7)
  num_list.push(6)
  return num_list
end

def print_insert_sort()
    num_list = get_sample_list()
    ArraySort.insert_sort(num_list)
    for i in (0..(num_list.length() - 1))
      print(num_list.get(i), " ")
    end
    print("\n")
end

def print_quick_sort()
  num_list = get_sample_list()
  ArraySort.quick_sort(num_list)
  for i in (0..(num_list.length() - 1))
    print(num_list.get(i), " ")
  end
  print("\n")
end

print_insert_sort()
print_quick_sort()
