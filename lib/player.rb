class Player < ActiveRecord::Base

  has_and_belongs_to_many :cards
  belongs_to :game

  def check_doubles
    hand = self.cards
    dupe_cards = hand.select{|card| hand.count("fish") == 2 }
    self.score += dupe_cards.length / 2
    dupe_cards.each do |card|
      # get_card(1)
      self.cards.delete(card)
    end
  end



end
