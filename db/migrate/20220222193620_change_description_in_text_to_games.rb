class ChangeDescriptionInTextToGames < ActiveRecord::Migration[6.1]
  def change
    change_column :games, :description, :text
  end
end
