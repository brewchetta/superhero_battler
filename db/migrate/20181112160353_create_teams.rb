class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :roster_name

      t.timestamps
    end
  end
end
