Dir[File.dirname(__FILE__) + '../../lib/*'].each { |file| require file }

fishes = ["dolphin", "whale", "shark", "swordfish", "blowfish", "onefish", "twofish", "redfish", "bluefish", "spongeBill", "starfish"]
2.times do
  fishes.each do |fish|
    Card.create({:fish => fish, :dealt => false})
  end
end
