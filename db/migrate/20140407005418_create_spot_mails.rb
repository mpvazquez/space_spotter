class CreateSpotMails < ActiveRecord::Migration
  def change
    create_table :spot_mails do |t|
      t.references :customer
      t.references :booking
      t.string :message_subject
      t.text :message_text
      t.timestamps
    end
  end
end
