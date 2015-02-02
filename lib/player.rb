class Player < ActiveRecord::Base

  has_and_belongs_to_many :cards
  belongs_to :game
end
