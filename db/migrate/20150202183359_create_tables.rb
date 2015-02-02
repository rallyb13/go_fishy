class CreateTables < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.column :score, :integer
      t.timestamps
    end

    create_table :cards do |t|
      t.column :fish, :string
      t.column :dealt, :boolean
      t.timestamps
    end

    create_table :cards_players do |t|
      t.column :player_id, :integer
      t.column :card_id, :integer
    end

    add_index :cards_players, :player_id
    add_index :cards_players, :card_id
    add_index :cards, :fish
    add_index :cards, :dealt
  end
end
