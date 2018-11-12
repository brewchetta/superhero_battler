class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :roster_name
      t.integer :user_id

      t.timestamps
    end
  end
end
