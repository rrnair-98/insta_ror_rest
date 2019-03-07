module UserHelper
  # This class contains a set of methods that are helpful to the user controller
  class UserControllerHelper
    def all_posts_by_specified_user(user_id, offset)
      Post.where(user_id: user_id).limit(5).offset(offset).order('created_at DESC')
    end
  end
end