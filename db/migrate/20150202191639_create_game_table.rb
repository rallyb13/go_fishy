class CreateGameTable < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.column :player_id, :integer
      t.timestamps
    end
  end
end
