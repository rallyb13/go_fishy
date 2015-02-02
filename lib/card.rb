class Card < ActiveRecord::Base

  def self.add_cards
    fishes = ["dolphin", "whale", "shark", "swordfish", "blowfish", "onefish", "twofish", "redfish", "bluefish", "spongeBill", "starfish"]
    2.times do
      fishes.each do |fish|
        Card.create({:fish => fish, :dealt => false})
      end
    end
  end

  scope(:not_dealt, -> do
    where({:dealt => false})
  end)

  default_scope {order('random()')}



end
