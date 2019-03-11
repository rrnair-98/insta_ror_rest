# User model
class User < ApplicationRecord
  has_many :follows
  def as_json(options = {})
    # todo add followers count in this JSON
    options[:except] = %i[created_at updated_at password is_private]
    super(options)
  end

end
