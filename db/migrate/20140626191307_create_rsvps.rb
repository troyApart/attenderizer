class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.integer :guest_id
      t.integer :event_id
      t.boolean :answer

      t.timestamps
    end
  end
end
