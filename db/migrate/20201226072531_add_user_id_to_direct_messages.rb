class AddUserIdToDirectMessages < ActiveRecord::Migration[6.0]
  def change
  	add_reference :direct_messages, :user, index: true
  end
end
