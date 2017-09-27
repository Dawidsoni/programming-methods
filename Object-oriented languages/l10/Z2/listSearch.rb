class ListSearch
  def self.bin_search(sorted_list, val)
    from_ind = 0
    to_ind = sorted_list.length()
    while from_ind < to_ind
      middle_ind = (from_ind + to_ind) / 2
      middle_val = sorted_list.get(middle_ind)
      if middle_val == val
        return middle_ind
      elsif middle_val < val
        from_ind = middle_ind + 1
      else
        to_ind = middle_ind
      end
    end
    return nil
  end

  def self.interp_search(sl, val)
    low = 0
    high = sl.length() - 1
    while sl.get(low) != sl.get(high) && val >= sl.get(low) && val <= sl.get(high)
      mid = (val - sl.get(low)) * (high - low)
      mid /= (sl.get(high) - sl.get(low))
      mid += low
      if sl.get(mid) == val
        return mid
      elsif sl.get(mid) < val
        low = mid + 1
      else
        high = mid - 1
      end
    end
    return nil
  end
end
