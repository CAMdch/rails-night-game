class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :game, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :date_begin
      t.date :date_end
      t.string :status

      t.timestamps
    end
  end
end
