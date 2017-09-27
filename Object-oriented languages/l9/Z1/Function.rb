class Function

  def initialize(func)
    @EPS = 1e-4
    @func = func
  end

  def value(x)
    @func.call(x)
  end

  def area(from_x, to_x, div_count = 1000)
    result = value(from_x) + value(to_x)
    step_size = (to_x - from_x) / div_count.to_f
    for i in (1..(div_count - 1))
      cur_val = from_x + (step_size * i)
      result += (2 * value(cur_val))
    end
    result *= (to_x - from_x)
    result /= (2 * div_count)
    return result
  end

  def derivative(arg_x, prec = 1e-4)
    return (value(arg_x + prec) - value(arg_x)) / prec
  end

  def root(from_x, to_x, prec = 1e-4)
    for arg in (from_x..to_x).step(prec)
      if(value(arg).abs() < @EPS)
        return arg
      end
    end
    return nil
  end
end
