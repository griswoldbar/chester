require 'chester/moves/base_move'

module Chester
  class RegularMove < BaseMove
    def target
      @target ||= @game.board.find {|s| s.x == @move[:target_file] && s.y == @move[:target_rank] }
    end

    private
    def disambiguate
      possible_pieces = @game.select_pieces_by(search_criteria)
      possible_pieces.select! { |p| executable?(p) }
        # require 'pry';binding.pry
      if possible_pieces.empty?
        @invalid = true
      elsif possible_pieces.size > 1
        @ambiguous = true
      else
        @piece = possible_pieces.first
      end
    end
    
    def search_criteria
      criteria = { 
        colour: @player,
        type: piece_type
      }
      criteria.merge!(x: @move[:source_file]) if @move[:source_file]
      criteria.merge!(y: @move[:source_rank]) if @move[:source_rank]
      
      criteria
    end
    
    def executable?(piece)
      @validator_factory.build(self, piece).executable?
    end
  end
end