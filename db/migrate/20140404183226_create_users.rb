class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :username
      t.string :password_digest
      t.integer :phone_number
      t.text :photo_url
      t.text :bio_text
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :role, default: 'customer'
      t.timestamps
    end
  end
end
