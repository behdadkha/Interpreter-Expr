#pow function is used to calculate the exponent
def pow(x,y)
	r = 1
	while y > 0
		r *= x
		y -= 1
	end
	return r
end
#IExpr is a class with many subclasses
#The subclasses are the operators of the language
class IExpr
	def interpret()
		puts("Wrong action")
	end

end
class Cons < IExpr
	attr_accessor :value
	def initialize(val)
		@value = val
	end
	def interpret()
		return value
	end
end
class Neg < IExpr
	attr_accessor :cons
	def initialize(cons)
		@cons = cons
	end
	def interpret()
		constant = cons.interpret()
		return (- constant)
	end
end
class Abs < IExpr 
	attr_accessor :expr
	def initialize(value)
		@expr = value
	end
	def interpret()
		exprValue = expr.interpret()
		#this checks if the input is negative or not
		return (exprValue < 0 ? -exprValue : exprValue)
	end
end

class Plus < IExpr
	attr_accessor :expr1, :expr2
	def initialize(obj1,obj2)
		@expr1 = obj1
		@expr2 = obj2
	end
	def interpret()
		return expr1.interpret() + expr2.interpret()
	end
end
class Times < IExpr
	attr_accessor :expr1, :expr2
	def initialize(obj1, obj2)
		@expr1 = obj1
		@expr2 = obj2
	end
	def interpret()
		return expr1.interpret() * expr2.interpret()
	end
end

class Minus < IExpr
	attr_accessor :expr1, :expr2
	def initialize(obj1,obj2)
		@expr1 = obj1
		@expr2 = obj2
	end
	def interpret()
		return expr1.interpret() - expr2.interpret()
	end
end

class Exp < IExpr
        attr_accessor :expr1, :expr2
        def initialize(obj1,obj2)
                @expr1 = obj1
                @expr2 = obj2
        end
        def interpret()
		r1 = expr1.interpret()
		r2 = expr2.interpret()
		return pow(r1,r2)
        end
end

=begin
	testing
	cons1 = Cons.new(5)
	cons2 = Cons.new(6)
	neg = Neg.new(cons1)
	abs = Abs.new(neg)
	plus = Plus.new(cons1, cons2)
	times = Times.new(plus, cons2)
	minus = Minus.new(plus, cons2)
	exp = Exp.new(cons1,cons2)
	puts("const: #{cons1.interpret()}")
	puts("neg: #{neg.interpret()}")
	puts("abs: #{abs.interpret()}")
	puts("plus: #{plus.interpret()}")
	puts("times: #{times.interpret()}")
	puts("minus: #{minus.interpret()}")
	puts("exp: #{exp.interpret()}")
=end

