class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.text :listing_photo_url
      t.text :description
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.decimal :rate
      t.references :vendor
      t.timestamps
    end
  end
end
