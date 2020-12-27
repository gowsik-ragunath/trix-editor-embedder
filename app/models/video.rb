class Video < ApplicationRecord
	 has_one_attached :clip
	 has_one_attached :thumbnail

	def self.sizes
		{
			thumbnail: { resize: "100x100" },
			hero1:     { resize: "1000x500" }
		}
  	end

  def sized(size)
    self.clip.preview(resize_to_limit: [852, 420]).processed
  end
end