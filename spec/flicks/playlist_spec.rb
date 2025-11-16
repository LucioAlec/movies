require_relative '../spec_helper'
require 'flicks/movies'
require 'flicks/playlist'
    module Flicks
    describe Playlist do
    before do
        @playlist = Playlist.new("Kermit")
    end

    context "being played with one movie" do
        before do
        @rank = 10
        @movie = Movie.new("goonies", @rank)
        @playlist.add_movie(@movie)
        end
        it "gives the movie a thumbs up if a high number is rolled" do
            allow(Reviewer).to receive(:roll_die).and_return(5)
=begin
    allow(@playlist).to receive(:roll_die) → diz ao RSpec:
    "quando alguém chamar o método roll_die nesse objeto (@playlist), não execute o método real (que usa rand), e sim o que eu vou definir agora."

    and_return(1) → define que sempre que roll_die for chamado durante o teste, ele vai devolver o valor 1.

    Ou seja:
    ➡️ Estamos forçando o retorno do método roll_die.
    ➡️ Isso elimina o acaso do rand(1..6) e deixa o teste determinístico (sempre igual, sem depender da sorte).
=end
            @playlist.play
            expect(@movie.rank).to eq(@rank + 1)
        end

        it "skips the movie if a medium number is" do
            allow(Reviewer).to receive(:roll_die).and_return(3)
            @playlist.play

            expect(@movie.rank).to eq(@rank)
        end  

        it "gives the movie a thumbs down if a low number is rolled"do
        allow(Reviewer).to receive(:roll_die).and_return(1)
        @playlist.play

        expect(@movie.rank).to eq(@rank - 1)
        end

        end

    end
end
