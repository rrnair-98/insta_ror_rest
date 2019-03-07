# frozen_string_literal: true

module LikesHelper
  # This class contains methods related to Like model
  class LikesHelperService
    def get_likes_with_post_id(post_id)
      Like.where(post_id: post_id).count
    end
  end
end