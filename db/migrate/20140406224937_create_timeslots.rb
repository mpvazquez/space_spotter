class CreateTimeslots < ActiveRecord::Migration
  def change
    create_table :timeslots do |t|
      t.date :date
      t.time :start_time
      t.time :stop_time
      t.boolean :booked, default: 'false'
      t.references :listing
      t.timestamps
    end
  end
end
