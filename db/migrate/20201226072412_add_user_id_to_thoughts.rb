class AddUserIdToThoughts < ActiveRecord::Migration[6.0]
  def change
  	add_reference :thoughts, :user, index: true
  end
end
