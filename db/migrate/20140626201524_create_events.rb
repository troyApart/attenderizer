class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :details
      t.datetime :date
      t.integer :time_interval
      t.datetime :time_of_last_send
      t.datetime :time_for_first_send

      t.timestamps
    end
  end
end
