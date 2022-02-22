class RemoveDatePOostReview < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :date_post
  end
end
