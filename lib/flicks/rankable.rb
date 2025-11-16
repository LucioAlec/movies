module Flicks
  module Rankable
      def thumbs_up
          self.rank += 1
          "#{@title} get's a thumbs up!"

      end
      def thumbs_down              #COMPORTAMENTO expresso como método de instância    
          self.rank -= 1
          "#{@title} get's a thumbs down!"
      end

      def status
      hit? ? "Hit" : "Flop" #if hit? "Hit" else "Flop"
      end

      def hit?
        self.rank >= 10
      end

      def <=>(other) 
=begin      
  O .sort funciona porque o Ruby depende do método <=> para comparar objeto.Se você não implementa <=>, ele não sabe o que fazer e dá erro. 
  O Ruby precisa comparar os elementos do array para decidir em que ordem colocá-los.
  Mas o Ruby não sabe como comparar objetos que você mesmo criou (no caso, instâncias da classe Movie).
  Ele só sabe comparar números, strings, etc., que já têm <=> implementado. 
=end
          other.rank <=> self.rank
      end

      def normalized_rank 
        self.rank/10
      end
  end
end