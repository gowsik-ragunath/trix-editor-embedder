class CreateRoomDirectMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :room_direct_messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.references :direct_message, null: false, foreign_key: true

      t.timestamps
    end
  end
end
