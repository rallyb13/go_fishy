class Player < ActiveRecord::Base

  has_and_belongs_to_many :cards
  belongs_to :game

  def get_card (number)
    number.times do
      card = Card.not_dealt.take
      card.update(dealt: true)
      self.cards.push(card)
    end
  end

  # def ask_for (opponent, my_card)
  #   opponent.cards.fish == my_card
  # end
end
