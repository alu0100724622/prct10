#require "matriznyj/version"

module Matriznyj

#============================================================================
#======================= CLASE MATRIZ (ABSTRACTA) ===========================
#============================================================================

class Matriz

end


#============================================================================
#========================= CLASE MATRIZ DENSA ===============================
#============================================================================


class Densa < Matriz

attr_accessor :matrix, :fil, :col						# define una variable matrix, fil, col y realiza por defecto 
														# un set y un get de dicha variable


	def initialize(filas, columnas, *args)
		
		@fil = filas
		@col = columnas
		@numCeldas = @fil * @col
		@matrix = Array.new(@fil) {Array.new(@col)}		# variable de instancia al accessor matrix que se hizo previamente
		
		
		if args.length != 0
			to_s(*args)
		end
		
	end



	def to_s(*args)
		
		if args.length != @numCeldas
			raise ArgumentError, "Numero incorrecto de elementos"
		else
			
			numEle = 0
			i = 0
			
			while i < @fil
				
				j = 0
				
				while j < @col
					
					@matrix[i][j] = args[numEle]
					numEle += 1
					j += 1
					
				end
				i += 1
				
			end
			
			return @matrix
			
		end
	end
	
	
	def +(other)
		
		#if ((other.class.to_s == "Densa") && (other.fil == @fil) && (other.col == @col))
			
			matrizSuma = Array.new(@fil) {Array.new(@col)}
			i = 0								
			
			while i < @fil						
				
				j = 0
				
				while j < @col					
					
					matrizSuma[i][j] = @matrix[i][j] + other.matrix[i][j]
					j += 1
					
				end
				
				i += 1
			end
			
			#puts "#{matrizSuma}"
			return matrizSuma
			
		#else
			#raise ArgumentError, "Matrices de distinto tamanio"
		#end
	end


	def -(other)
		
		#if ((other.class.to_s == "Densa") && (other.fil == @fil) && (other.col == @col))
			
			matrizResta = Array.new(@fil) {Array.new(@col)}
			i = 0								
			
			while i < @fil						
				
				j = 0
				
				while j < @col					
					
					matrizResta[i][j] = @matrix[i][j] - other.matrix[i][j]
					j += 1
					
				end
				
				i += 1
			end
			
			#puts "#{matrizResta}"
			return matrizResta
			
		#else
			#raise ArgumentError, "Matrices de distinto tamanio"
		#end
	end
	
	
	def *(other)
		
		#if ((other.class.to_s == "Densa") && (@fil == @col) && (other.fil == other.col) && (@fil == other.fil))
			
			matrizMult = Array.new(@fil) {Array.new(@col)}
			i = 0								
			
			while i < @fil						
				
				j = 0
				
				while j < @col					
					
					matrizMult[i][j] = 0		
					k = 0
					
					while k < @col				
						
						matrizMult[i][j] = matrizMult[i][j] + (@matrix[i][k] * other.matrix[k][j])
						k += 1
						
					end
					
					j += 1
					
				end
				
				i += 1
				
			end
			
			#puts "#{matrizMult}"
			return matrizMult
			
		#else
			#raise ArgumentError, "Numero distinto de filas y columnas"
		#end
		
	end
	
	def minimo
		
		min = 0
		
		i = 0								
		
		while i < @fil						
			
			j = 0
			
			while j < @col					
				
				if(@matrix[i][j] < min)
					
					min = @matrix[i][j]
					
				end
				
				j += 1
				
			end
			
			i += 1
			
		end
		
		#puts "minimo: #{min}"
		
		return min
		
	end
	
	
	def maximo
		
		max = 0
		
		i = 0								
		
		while i < @fil						
			
			j = 0
			
			while j < @col					
				
				if(@matrix[i][j] > max)
					
					max = @matrix[i][j]
					
				end
				
				j += 1
				
			end
			
			i += 1
			
		end
		
		#puts "maximo: #{max}"
		
		return max
		
	end
	
end


#============================================================================
#======================= CLASE MATRIZ DISPERSA ==============================
#============================================================================



class Dispersa < Matriz

	attr_accessor :matrix, :fil, :col, :eleM, :filM, :colM, :numElementos

	def initialize(filas, columnas, *args)
		
		@fil = filas
		@col = columnas
		@numCeldas = @fil * @col
		@numElementos = 0											# numero de elementos NO NULOS de la matriz
		
		@eleM = Array.new(0)										# matriz con los elementos no nulos de matrix
		@filM = Array.new(0)										# matriz con los numeros de fila asociado
		@colM = Array.new(0)										# matriz con los numeros de columna asociado
		
		
		
		#------------- COMPROBAR ELEMENTOS NO NULOS DE LA MATRIZ QUE SE HA PASADO -------------------
		
		if args.length == 0
			raise ArgumentError, "Numero incorrecto de elementos"
		else
			
			i = 0
			numElem = 0													# numero de elementos de la matriz
			
			while i < args.length
				
				if args[i] != 0
					
					@eleM.push(args[i])
					calcularFilCol(numElem)
					@numElementos += 1
					
				end
				
				numElem += 1
				i += 1
			end
			
		end
		
		#------------------------------------------------------------------------------------------------
		
		
		#puts "eleM: #{@eleM}"
		#puts "filM: #{@filM}"
		#puts "colM: #{@colM}"
		#puts "numEl: #{@numElementos}"
		
		
	end
	
	def calcularFilCol(numElem)
		
		i = 0
		num = 0
		
		while i < @fil
			
			j = 0
			
			while j < @col
				
				if (num == numElem)
					
					@filM.push(i)
					@colM.push(j)
					
				end
				
				num += 1
				j += 1
				
			end
			
			i += 1
			
		end
		
	end
	
	
	def minimo
		
		min = 0
		
		i = 0
		
		while i < @numElementos						
			
			if(@eleM[i] < min)
				
				min = @eleM[i]
				
			end
			
			i += 1
		end
		
		#puts "minimo: #{min}"
		
		return min
		
	end
	
	
	def maximo
		
		max = 0
		
		i = 0
		
		while i < @numElementos						
			
			if(@eleM[i] > max)
				
				max = @eleM[i]
				
			end
			
			i += 1
		end
		
		#puts "maximo: #{max}"
		
		return max
		
	end


	def to_s
		
		matrizMuestra = Array.new(@fil) {Array.new(@col) {0}}
		
		numEle = 0
		i = 0
			
		while i < @numElementos						
			
			matrizMuestra[@filM[i]][@colM[i]] = @eleM[i]
			
			i += 1
		end
		
		#puts "muestra = #{matrizMuestra}"
		return matrizMuestra
		
	end

	

	def +(other)
		
		#if ((other.class.to_s == "Dispersa") && (other.fil == @fil) && (other.col == @col))
			
			matrizSuma = Array.new(@fil) {Array.new(@col) {0}}
			
			i = 0
			
			while i < @numElementos						
				
				matrizSuma[@filM[i]][@colM[i]] = @eleM[i]
				
				i += 1
			end
			
			i = 0
			
			while i < other.numElementos						
				
				matrizSuma[other.filM[i]][other.colM[i]] += other.eleM[i]
				
				i += 1
			end
			
			
			#puts "suma = #{matrizSuma}"
			return matrizSuma
			
		#else
			#raise ArgumentError, "Matrices de distinto tamanio"
		#end
	end


	def -(other)
		
		#if ((other.class.to_s == "Dispersa") && (other.fil == @fil) && (other.col == @col))
			
			matrizResta = Array.new(@fil) {Array.new(@col) {0}}
			
			i = 0
			
			while i < other.numElementos						
				
				matrizResta[other.filM[i]][other.colM[i]] = 0 - other.eleM[i]
				
				i += 1
			end
			
			
			i = 0
			
			while i < @numElementos						
				
				matrizResta[@filM[i]][@colM[i]] += @eleM[i] 
				
				i += 1
			end
			
			
			#puts "resta = #{matrizResta}"
			return matrizResta
			
		#else
			#raise ArgumentError, "Matrices de distinto tamanio"
		#end
	end


end
end
