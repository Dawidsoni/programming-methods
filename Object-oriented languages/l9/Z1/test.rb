require_relative("Function")

proc = lambda {|x| 2 * x + 1}
funcObj = Function.new(proc)
puts(funcObj.value(2))
puts(funcObj.area(0, 1))
puts(funcObj.derivative(5))
puts(funcObj.root(-2, 2))
