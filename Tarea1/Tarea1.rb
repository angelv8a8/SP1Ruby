module Tarea1 

	def palindromo?(x)

		tam = x.to_s.size

		valid = true;
		0.upto(x.size-1) do | i  |
				str =  x[i].concat(" ").concat(x[tam-i-1])
				
				if x[i] != x[tam-i-1]
						valid = false;
						break;
				end
		end

		return valid

	end

	class Dessert
	    def initialize(name, calories)
	      # YOUR CODE HERE
	    end
	    
	    def healthy?
	      # YOUR CODE HERE
	    end
	    
	    def delicious?
	      # YOUR CODE HERE
	    end
	    
	    def to_s
	      # YOUR CODE HERE
	    end
	end

	class JellyBean < Dessert
	    def initialize(name, calories, flavor)
	      # YOUR CODE HERE
	    end
	end

end