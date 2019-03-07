# frozen_string_literal: true

# Image model
class Image < ApplicationRecord
  belongs_to :post

  def as_json(options = {})
    options[:except] = %i[updated_at created_at post_id]
    super(options)
  end
end
