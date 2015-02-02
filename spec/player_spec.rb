require('spec_helper')

describe(Player) do
  it {should have_and_belong_to_many :cards}
  it {should belong_to :game}


end
