class CreateHeros < ActiveRecord::Migration[5.1]
  def change
    create_table :heros do |t|
      t.string :name
      t.string :description
      t.string :image_url
      t.integer :api_id
      t.string :api_url

      t.timestamps
    end
  end
end
