class Embed < ApplicationRecord
  include ActionText::Attachable

  validates :url, presence: true

  def to_trix_content_attachment_partial_path
    "embeds/embed"
  end
end
