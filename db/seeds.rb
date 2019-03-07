# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


def createUsersAndPosts
  @i = 20
  20.times do
    @user = User.create({email: Faker::Internet.email,
                         name: Faker::Name.name, password: "password",
                         status: Faker::Quote.matz, is_private: false})
    print(@user.id)
    20.times do
      @post = Post.create(user_id: @user.id, is_private: (@i & 1),
                          caption: Faker::Quote.yoda)
      2.times do
        Image.create({post_id: @post.id,
                      image_url: "http://localhost:3000/images/helloworld.jpeg"})
      end
      @i+=1
    end
  end

end

# this takes a long time :)
def insert_likes_and_comments
  num_users = User.count
  num_posts = Post.count
  post_iter = 1
  num_posts.times do
    user_iter = 1

    num_users.times do
      Like.create(post_id: post_iter, user_id: user_iter)
      Comment.create(user_id: user_iter, post_id: post_iter, desc: Faker::LeagueOfLegends.quote)
      user_iter += 1
    end

    post_iter += 1
  end
end

insert_likes_and_comments
#createUsersAndPosts