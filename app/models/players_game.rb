class PlayersGame < ActiveRecord::Base
  validate :two_players
  belongs_to :player
  belongs_to :game

  def two_players
    Game.all.each do |record_id|
      if PlayersGame.where(game_id: record_id.id).length == 2
        return true
      else
        return false
      end
    end
  end
end
