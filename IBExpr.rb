#the pow function is used for exp to calculate the exponent
def pow(x,y)
	r = 1
	while y > 0
		r *= x
		y -= 1
	end
	return r
end
#the class IExpr is an integer expresion
#with the operators being the sub classes of this IExpr class
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
		#check if the input is valid(it is not boolean..)
		if(value.is_a? Integer) || (value.is_a? Float)
			return value
		else
			puts("Not a valid expression")
	
		end
	end
end
class Neg < IExpr
	attr_accessor :cons
	def initialize(cons)
		@cons = cons
	end
	def interpret()
		#checks if the input is not a boolean expression
		if !([true,false].include? cons.interpret())
			constant = cons.interpret()
			return (- constant)
		else
			puts("Not a valid expression")

		end
		
	end
end
class Abs < IExpr 
	attr_accessor :expr
	def initialize(value)
		@expr = value
	end
	def interpret()
		if !([true,false].include? expr.interpret())
			exprValue = expr.interpret()
			return (exprValue < 0 ? -exprValue : exprValue)
		else
			puts("Not a valid expression")

		end
		
	end
end

class Plus < IExpr
	attr_accessor :expr1, :expr2
	def initialize(obj1,obj2)
		@expr1 = obj1
		@expr2 = obj2
		
	end
	def interpret()
		objI1 = expr1.interpret()
		objI2 = expr2.interpret()
		if !([true,false].include? objI1) && !([true,false].include? objI2)
			
			return objI1 + objI2
		else
			puts("Not a valid expression")

		end
		
	end
end
class Times < IExpr
	attr_accessor :expr1, :expr2
	def initialize(obj1, obj2)
		@expr1 = obj1
		@expr2 = obj2
	end
	def interpret()
		objI1 = expr1.interpret()
		objI2 = expr2.interpret()
		if !([true,false].include? objI1) && !([true,false].include? objI2)
			
			return objI1 * objI2
		else
			puts("Not a valid expression")

		end
	end
end

class Minus < IExpr
	attr_accessor :expr1, :expr2
	def initialize(obj1,obj2)
		@expr1 = obj1
		@expr2 = obj2
	end
	def interpret()
		objI1 = expr1.interpret()
		objI2 = expr2.interpret()
		if !([true,false].include? objI1) && !([true,false].include? objI2)
			
			return objI1 - objI2
		else
			puts("Not a valid expression")

		end
	end
end

class Exp < IExpr
        attr_accessor :expr1, :expr2
        def initialize(obj1,obj2)
			@expr1 = obj1
			@expr2 = obj2  
        end
		def interpret()
			objI1 = expr1.interpret()
			objI2 = expr2.interpret()
			if !([true,false].include? objI1) && !([true,false].include? objI2)
				
				return pow(objI1, objI2)
			else
				puts("Not a valid expression")

			end
        end
end
#Ttt and Fff dont need constructors
class Ttt < IExpr
	def interpret()
		return true
	end
end

class Fff < IExpr
        
        def interpret()
                return false
        end
end

class Lnot < IExpr
        attr_accessor :expr
        def initialize(obj)
			@expr = obj
        end
		def interpret()
			#this makes sure that the input is a boolean expr
			if ([true,false].include? expr.interpret())
				return !expr.interpret()
			else
				puts("Not a valid expression")

			end
		
        end
end

class Land < IExpr
        attr_accessor :expr1, :expr2
        def initialize(obj1, obj2)
			@expr1 = obj1
			@expr2 = obj2
        end
		def interpret()
			objI1 = expr1.interpret()
			objI2 = expr2.interpret()
			if ([true,false].include? objI1) && ([true,false].include? objI2)
					
					return objI1 && objI2
			else
					puts("Not a valid expression")

			end
		
        end
end

class Lor < IExpr
        attr_accessor :expr1, :expr2
        def initialize(obj1, obj2)
			@expr1 = obj1
			@expr2 = obj2

        end
        def interpret()
			objI1 = expr1.interpret()
			objI2 = expr2.interpret()
			if ([true,false].include? objI1) && ([true,false].include? objI2)
					
					return objI1 || objI2
			else
					puts("Not a valid expression")

			end
        end
end


=begin
	cons1 = Cons.new(5)
	cons2 = Cons.new(6)
	neg = Neg.new(cons1)
	abs = Abs.new(neg)
	plus = Plus.new(cons1, cons2)
	times = Times.new(plus, cons2)
	minus = Minus.new(plus, cons2)
	exp = Exp.new(cons1,cons2)
	tRue = Ttt.new()
	fAlse = Fff.new()
	lnot = Lnot.new(tRue)
	land = Land.new(tRue, fAlse)
	lor = Lor.new(tRue, fAlse)

	puts("const: #{cons1.interpret()}")
	puts("neg: #{neg.interpret()}")
	puts("abs: #{abs.interpret()}")
	puts("plus: #{plus.interpret()}")
	puts("times: #{times.interpret()}")
	puts("minus: #{minus.interpret()}")
	puts("exp: #{exp.interpret()}")
	puts("lnot ttt: #{lnot.interpret()}")
	puts("land ttt fff: #{land.interpret()}")
	puts("lor ttt fff: #{lor.interpret()}")
	#wrongPlus = Plus.new(tRue ,cons1)
=end
