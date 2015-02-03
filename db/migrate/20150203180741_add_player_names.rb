class AddPlayerNames < ActiveRecord::Migration
  def change

    add_column :players, :name, :string
    add_column :players, :player_num, :integer

  end
end
