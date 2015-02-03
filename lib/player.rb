class Player < ActiveRecord::Base

  has_and_belongs_to_many :cards
  belongs_to :game
  validates_presence_of :name

  default_scope {order('player_num')}


  def check_doubles
    hand = self.cards
    dupe_cards = hand.select{|card| hand.count("fish") == 2 }
    self.score += dupe_cards.length / 2
    dupe_cards.each do |card|
      get_card(1)
      self.cards.delete(card)
    end
  end

  def get_card (number)
    number.times do
      card = Card.not_dealt.order("RANDOM()").first
      card.update(dealt: true)
      self.cards.push(card)
    end
  end

  def ask_for (opponent, my_card)
    opponent.cards.each() do |card|
      if card.fish == my_card
        self.cards.push(card)
        opponent.cards.delete(card)
      else

      end
    end
  end

end
