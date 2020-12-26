class Thought < ApplicationRecord
	
	# Associations
	belongs_to :user

	# Action text
	has_rich_text :content
end
