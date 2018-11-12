class CreateBattles < ActiveRecord::Migration[5.1]
  def change
    create_table :battles do |t|
      t.string :name
      t.integer :team_id1
      t.integer :team_id2

      t.timestamps
    end
  end
end
