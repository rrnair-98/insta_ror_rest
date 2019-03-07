# frozen_string_literal: true

module CommentsHelper
  # This class contains methods related to Comment model
  class CommentsHelperService
    def get_comments_with_post(post_id, offset)
      print(offset)
      Comment.where(post_id: post_id).limit(5).offset(offset).order('created_at DESC')
    end
  end
end
