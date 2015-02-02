require('spec_helper')

describe(Player) do
  it {should have_and_belong_to_many :cards}
  it {should belong_to :game}

  describe "check_doubles" do
    player1 = Player.new()
    player1.get_cards()
    expect(player1.check_doubles()).to eq(true)
  end


end
