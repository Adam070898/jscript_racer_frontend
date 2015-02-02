class Player < ActiveRecord::Base
  has_many :games, through: :players_games
  has_many :players_games
  validates :name, uniqueness: true
end
