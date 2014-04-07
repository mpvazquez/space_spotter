class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :customer
      t.references :vendor
      t.string :review_subject
      t.text :review_text
      t.integer :review_score
      t.timestamps
    end
  end
end
