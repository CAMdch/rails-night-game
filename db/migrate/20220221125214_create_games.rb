class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :description
      t.float :price
      t.string :name
      t.integer :min_player
      t.integer :max_player
      t.integer :playtime
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
