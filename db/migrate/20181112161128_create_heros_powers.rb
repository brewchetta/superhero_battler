class CreateHerosPowers < ActiveRecord::Migration[5.1]
  def change
    create_table :heros_powers do |t|
      t.integer :hero_id
      t.integer :power_id

      t.timestamps
    end
  end
end
