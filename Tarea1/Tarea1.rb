module Tarea1 
  
  def atoi(str)
    
    valor = 0
    
    digitos = str.split("")
    
    digitosC = digitos.count
    digitosC -= 1
    
    mul = 1
    
    digitosC.downto(0) do | i |
      case digitos[i]
        when "0"
          valor = valor
        when "1"
          valor += 1 * mul
        when "2"
        valor += 2*mul
        when "3"
        valor += 3*mul
        when "4"
        valor += 4*mul
        when "5"
        valor += 5*mul
        when "6"
        valor += 6*mul
        when "7"
        valor += 7*mul
        when "8"
        valor += 8*mul
        when "9"
        valor += 9*mul
      else
        puts "Error, digito invalido " + digitos[i]
        return
        
      end
      mul = mul*10
    end 
    
    return valor
  end
  
  def char_count( s,  c)
    
    letras = s.split("");
    contador = 0
    
    if c.to_s.size > 1
      puts "ERROR: El segundo parametro debe ser un caracter"
      return nil
    end
    
    letrasC = letras.count
    0.upto(letrasC - 1) do | i |
      if c  == letras[i] 
        contador += 1
      end
    end
    
    return contador
  end
  
  def sort(elArray, is_asc)
    
    resultado = Array.new
    #puts elArray
    0.upto(elArray.count - 1) do |i|
      
      if is_asc 
        indexMenor = getMayor(elArray)
      else
        indexMenor  = getMenor(elArray)
      end
      #puts "menor " + indexMenor.to_s
      palabraMenor = elArray.delete_at(indexMenor)
      resultado.insert(0,palabraMenor)
    end
    
    return resultado
    
  end
  
  def getMayor(array)
    
    index = 0;
    mayor = array[0]
    
    0.upto(array.count - 1  ) do | i | 
      #puts "It " + i.to_s
      if  array[i] >= mayor
        mayor = array[i]
        index = i
      end
    end
    return index
      
  end
  
  def getMenor(array)
    
    index = 0;
    menor = array[0]
    0.upto(array.count - 1  ) do | i | 
      if  array[i] <= menor
        menor = array[i]
        index = i
      end
    end
    return index
      
  end
    
    
  def hanoi(height,fromPole, toPole, withPole)
    height_i = height.to_i
    if height_i >= 1
      hanoi(height_i-1,fromPole.to_i,withPole.to_i,toPole.to_i)
      moveDisk(fromPole.to_i,toPole.to_i)
      hanoi(height_i-1,withPole.to_i,toPole.to_i,fromPole.to_i)
    end
  end

  def moveDisk(fp,tp)
    puts "Mover disco de " + fp.to_i.to_s + " a " + tp.to_i.to_s
  end
  
  def cuenta_palabras (frase)
    
    hash = Hash.new(0)
    
    palabras = frase.to_s.split(" ")
    puts "Tamaño " + palabras.count.to_s
    c_palabras = palabras.count
    0.upto(c_palabras -1) do | i |

    #puts palabras[i].to_s + " " + hash[palabras[i].to_s].to_s
    hash[palabras[i].to_s] =  hash[palabras[i].to_s] + 1
      
    end
    
    
    return hash
  end

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
    
    @@desserts = 0
    
    def name=(value)
      @value = value
    end
    def name
      @name
    end
    
    def calories=(value)
      @calories = value
    end
    
    def calories
      @calories
    end
    
    
	    def initialize(name, calories)
        @name = name
        @calories = calories
        @size = nil
        
        @@desserts += 1

	    end
	    
	    def healthy?
        if @calories < 200
          return true
        end
        return false
	    end
	    
	    def delicious?
        return true
	    end
	    
    def count
      return @@desserts
    end
    
	    def to_s
	      # YOUR CODE HERE
	    end
	end

	class JellyBean < Dessert
    def flavor=(value)
      @flavor = value
    end
    
    def flavor
      @flavor
    end
	    def initialize(name, calories, flavor)
        super(name, calories)
        @flavor = flavor
       
	    end
    
    def delicious? 
      if @flavor == "black licorice"
        return false
      end
      
      return super
    end
	end

end


module Action
  
  @@distance = 0;
  def jump(vel)
    @@distance = rand(vel.to_i) + 2
    puts "I jumped forward #{@@distance} feet!"
  end
end

class Rabbit
  include Action
  
  attr_reader :name, :velocidad
  
  def initialize(name)
    @name = name
    @velocidad = 8
  end
  
  def run()
    distInicial = 0
    start = Time.now
    while distInicial < 33 do
      jump(@velocidad)
      distInicial += @@distance
    end
    puts (Time.now - start).to_s + " segundos"
  end
end

class Cricket
  include Action
  #include Date
  
  attr_reader :name, :velocidad

  def chirp()
    0.upto(10 + rand(90)) do | i |
      puts i.to_s  + " Chirp... chirp!!!"
    end
  end
    
  def initialize(name)
    @name = name
    @velocidad = 4
  end
  
  def run()
    distInicial = 0
    start = Time.now
    while distInicial < 33 do
      jump(@velocidad)
      distInicial += @@distance
    end
    puts (Time.now - start).to_s + " segundos"
  end
end


class Computer
  include Tarea1
  
    @@users = {}
    
    @fileDir
    def initialize username, password
        @username = username
        @password = password
      
        @fileDir = Hash.new
        
        @files = {}
    end
  
  def insert (name)
    if @fileDir[name] == 0
      puts "Error, el archivo ya existe"
    else
      @fileDir[name] = Time.now.to_s
    end
  end
  
  def ls (sort)
    keys = @fileDir.keys
    if sort.to_s == "asc"
      keys = Tarea1.sort(keys,true)
    else
      keys = Tarea1.sort(keys,false)
    end
      
    0.upto(keys.count-1) do | i |
      puts keys[i] + "\t" + @fileDir[keys[i]]
    end
    puts "End of List"
  end
end
