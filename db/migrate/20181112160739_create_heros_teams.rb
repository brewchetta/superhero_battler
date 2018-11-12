class CreateHerosTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :heros_teams do |t|
      t.integer :hero_id
      t.integer :team_id

      t.timestamps
    end
  end
end
