require 'chester/application_builder'
require 'chester/interpreters/move_interpreter'
require 'chester/interpreters/input_interpreter'
require 'chester/interpreters/admin_interpreter'
require 'chester/command_runner'
require 'chester/output_handler'
require 'chester/application'
require 'chester/game'
# require 'chester/board'
require 'chester/player'
require 'chester/game_state'

module Chester
  module Console
    def app
      @app ||= ApplicationBuilder.build(Application) do |app|
        app.game = Game.build do |g|
          g.players = [Player.new, Player.new]
          g.game_state = GameState.load(game_hash)
        end


        app.command_runner = CommandRunner.build do |i|

        end

        app.output_handler = OutputHandler.new

        app.input_interpreter = InputInterpreter.build do |i|
          i.move_interpreter = MoveInterpreter.new
          i.admin_interpreter = AdminInterpreter.new
        end
      end
    end

    def game_hash
      {
        :board => {
          11 => 'WR', 12 => 'WN', 13 => 'WB', 14 => 'WQ', 15 => 'WK', 16 => 'WB', 17 => 'WN', 18 => 'WR',
          21 => 'WP', 22 => 'WP', 23 => 'WP', 24 => 'WP', 25 => 'WP', 26 => 'WP', 27 => 'WP', 28 => 'WP',
          31 => nil, 32 => nil, 33 => nil, 34 => nil, 35 => nil, 36 => nil, 37 => nil, 38 => nil,
          41 => nil, 42 => nil, 43 => nil, 44 => nil, 45 => nil, 46 => nil, 47 => nil, 48 => nil,
          51 => nil, 52 => nil, 53 => nil, 54 => nil, 55 => nil, 56 => nil, 57 => nil, 58 => nil,
          61 => nil, 62 => nil, 63 => nil, 64 => nil, 65 => nil, 66 => nil, 67 => nil, 68 => nil,
          71 => 'BP', 72 => 'BP', 73 => 'BP', 74 => 'BP', 75 => 'BP', 76 => 'BP', 77 => 'BP', 78 => 'BP',
          81 => 'BR', 82 => 'BN', 83 => 'BB', 84 => 'BQ', 85 => 'BK', 86 => 'BB', 87 => 'BN', 88 => 'BR'
        },
        :current_player => 1
      }
    end
  end
end

include Chester::Console