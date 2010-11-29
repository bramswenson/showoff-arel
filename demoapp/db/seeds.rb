# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create!(:name => 'Daley', :city => cities.first)
require Rails.root.join('spec/spec_helper.rb')

def rand_range
  (1..(rand(10)+1))
end

(1..25).each do
  email = Factory.next(:email)
  puts "trying email: #{email}"
  begin
    user = User.create!(:email => email,
                    :blog_name => Factory.next(:title),
                    :password => random_chars(10))
  rescue
    next
  end
  puts "Added user: #{user.email}"
  rand_range.each do
    post = Post.create!(:user => user, :title => Factory.next(:title),
                       :body => Factory.next(:body))
    puts "  Added post for #{user.email}: #{post.title}"
    rand_range.each do
      comment = Comment.create!(:name => Factory.next(:name), 
                               :title => Factory.next(:title),
                               :comment => Factory.next(:comment),
                               :post => post)
      puts "    Added comment for #{post.title}: #{comment.title}"
    end
  end
end

puts "User Count #{User.count}"
puts "Post Count #{Post.count}"

@all_user_ids = User.select(:id).all.map { |u| u.id }
@all_post_ids = Post.select(:id).all.map { |p| p.id }

User.all.each do |user|
  puts "Rocking with user #{user.email}"
  (1..rand(@all_post_ids.size/2)).each do |i|
    available_post_ids = @all_post_ids - user.posts_rated.all.map { |p| p.id }
    post = Post.find(available_post_ids[ rand( available_post_ids.size ) ])
    rating = rand(4) + 1
    rating = Rating.create!(:rater => user, :rating => rating, :post => post)
    puts "  #{rating.rater.email} gave #{rating.rating} stars to #{rating.post.title}"
  end
  (1..rand(@all_user_ids.size)).each do |i|
    available_user_ids = @all_user_ids - user.following.all.map { |u| u.id }
    followed = User.find(available_user_ids[ rand( available_user_ids.size ) ])
    following = Following.create!(:follower => user, :followed => followed)
    puts "  #{following.follower.email} is now following #{following.followed.email}"
  end
end
