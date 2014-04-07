class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :customer
      t.references :timeslot
      t.text :review_text
      t.integer :review_score
      t.decimal :price
      t.timestamps
    end
  end
end
