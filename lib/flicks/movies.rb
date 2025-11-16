
=begin
(((
attr_reader :title é a mesma coisa que:
def title
    @reader 
end 
)))
(((
attr_writer :title é a mesma coisa que:
def title=(new_title)
    @title = new_title
)))
(((
attr_accessor :title é a mesma coisa que: 
def title
    @reader 
end 
def title=(new_title)
    @title = new_title
Ou seja, a união dos dois
)))
=end
require_relative 'rankable'
module Flicks
	class Movie
			include Rankable

			#attr_reader :rank 
			attr_accessor :title, :rank
			def initialize(title, rank=0) #ESTADO armazena a variáveis de instância
					@title = title.capitalize
					@rank= rank
					@snack_carbs = Hash.new(0)
			#puts "Created a movie object with object with title #{title} and a rank #{rank}"
	end

#INPUT(LEITURA DE DADOS EXTERNOS)
	def self.from_csv(line) #método de class
			title, rank = line.split(',') # se a linha é "Goonies, 10", o split(',') vira: ["Goonies", "10"]
		Movie.new(title, Integer(rank)) #não precisa de um objeto já criado #Movie.new cria realmente o objeto completo com os atributos certos: Movie.new("Goonies", 10)
		# Integer(health) Converte a String "10" para inteiro, isso é importante porque vindo de arquivo tudo é texto
		#AGORA VOCÊ CONSEGUE POPULAR SUA APLICAÇÃO INTEIRA LENDO UM ARQUIVO .csv EM VEZ DE CRIAR TUDO "NA MÃO" NO CÓDIGO.
	end


	def to_txt
			"#{@title}, #{@rank}"
	end


			def each_snack
					@snack_carbs.each do |name, carbs|
							sna = Snack.new(name, carbs)
						yield sna 
					end
			end

			def carbs_consumed
					@snack_carbs.values.reduce(0, :+)
			end


			def ate_snack(snack)
					@snack_carbs[snack.name] += snack.carbs # += serve para acumular
					puts "#{@title} led to #{snack.carbs} #{snack.name} carbs being consumed"
					puts "#{@title}'s snacks: #{@snack_carbs}"
			end



			def to_s 
					"#{@title} has a rank of #{@rank} (#{status})"
	end



	end
end
	if __FILE__ == $0
			movie = Movie.new("Filme teste",10)
			puts movie.title
			puts movie.rank

			puts movie.thumbs_down
			puts movie.thumbs_up
			puts movie.thumbs_up
			puts movie
	end