# User model
class User < ApplicationRecord

  def as_json(options = {})
    # todo add followers count in this JSON
    options[:except] = %i[created_at updated_at password is_private]
  end

end
