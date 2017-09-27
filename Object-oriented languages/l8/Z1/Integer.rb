class Integer #Fixnum is deprecated in Ruby 2.4
  WORD_LIST = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]

  def factors()
    result = []
    for i in 1...(self + 1)
      if self % i == 0
        result.push(i)
      end
    end
    return result
  end

  def is_perfect_number()
    return (factors().inject(0, :+) == 2 * self)
  end

  def verbally()
    result = []
    cur_value = self.abs()
    if cur_value == 0
      return WORD_LIST[0]
    end
    while cur_value > 0
      result.push(WORD_LIST[cur_value % 10])
      cur_value /= 10
    end
    if self < 0
      result.push("minus")
    end
    return result.reverse().join(" ")
  end

  def ack(argNum)
    if self == 0
      return argNum + 1
    elsif argNum == 0
      return (self - 1).ack(1)
    else
      return (self - 1).ack(self.ack(argNum - 1))
    end
  end
end
