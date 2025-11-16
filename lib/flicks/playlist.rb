require_relative 'movies'
require_relative 'reviewers'
require_relative 'snack_bar'
module Flicks
    class Playlist
        def initialize(name)
            @name = name
            @movies = []
        end

        def load(from_file)
        File.readlines(from_file).each do |line| #abre um arquivo de texto e lê todas as linhas e devolve um array de strings
        add_movie(Movie.from_csv(line)) #cria um objeto (Movie) A PARTIR do texto do arquivo
        end
    end

    def save(to_file="movie_rankings.txt")
        File.open(to_file, "w") do |file|
        @movies.sort.each do |movie|
            file.puts movie.to_txt
        end
    end
    end

        def add_movie(movie)
            @movies << movie # sinal de << append Significa literalmente: Pega o array @movies e adicione o objeto movie ao final dele
        end


        def play(viewings=1)
            puts "#{@name}'s playlist: "

            puts @movies.sort 
            snacks = SnackBar::SNACKS
            puts "\nThere are #{snacks.size} snacks available in the snack bar."

            snacks.each do |snakc|
                puts "#{snakc.name} has #{snakc.carbs} carbs."
            end 

            1.upto(viewings) do |count|
                puts "\nViewing #{count}"
                @movies.each do |m|
                Reviewer.review(m)
                snack = SnackBar.random
                m.ate_snack(snack)
                puts m
            end
            end
            puts "----------"
        end
        
        def total_carbs_consumed
        @movies.reduce(0) do |sum, movie|
            sum + movie.carbs_consumed
        end
        end

        def print_stats
            puts "\n#{@name}'s Stats:"
            
            puts "#{total_carbs_consumed} total carbs consumed"
            @movies.sort.each do |mov|
                puts "\n#{mov.title}'s snack totals:"
                mov.each_snack do |snac|
                    puts "#{snac.carbs} total #{snac.name} carbs"
                end
                puts "\n#{mov.carbs_consumed} grand total carbs"
            end

            hits, flops = @movies.partition do |movie| movie.hit? end

                puts "\nHits:"
                puts hits.sort

                puts "\nFlops:"
                puts flops.sort
        end
        
    end
end