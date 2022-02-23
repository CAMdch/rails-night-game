class CreateWhichlists < ActiveRecord::Migration[6.1]
  def change
    create_table :whichlists do |t|
      t.boolean :like
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
