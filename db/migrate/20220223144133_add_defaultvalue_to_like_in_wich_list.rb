class AddDefaultvalueToLikeInWichList < ActiveRecord::Migration[6.1]
  def change
    change_column :whichlists, :like, :boolean, default: false
  end
end
