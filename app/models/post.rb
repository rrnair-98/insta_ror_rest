class Post < ApplicationRecord
  has_many :images
  attr_accessor :likes
  def as_json(option = {})
    options ||= { except: %i[created_at updated_at user_id], include: [images: { only: %i[id image_url] }] }
    #self.likes = Like.where(post_id: self[:post_id]).count

    super(options)
  end

  def attributes
    #super.merge('likes' => self.likes)
  end
end
