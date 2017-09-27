require_relative("Function")

proc = lambda {|x| 2 * x + 1}
funcObj = Function.new(proc)
funcObj.plot(-3, 3, "example.gif")
