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

def insertLikesAndComments
  @i= User.count
  print(@i)
  @i.times do

    Comment.create

  end
end

#createUsersAndPosts