require_relative("sortedList")
require_relative("listSearch")

sorted_list = SortedList.new()
sorted_list.insert(2)
sorted_list.insert(1)
sorted_list.insert(3)
sorted_list.insert(4)
sorted_list.insert(7)
sorted_list.insert(5)
print(sorted_list)
print(sorted_list.get(1), "\n")
print(ListSearch.bin_search(sorted_list, 3), "\n")
print(ListSearch.bin_search(sorted_list, 6), "\n")
print(ListSearch.interp_search(sorted_list, 3), "\n")
print(ListSearch.interp_search(sorted_list, 6), "\n")