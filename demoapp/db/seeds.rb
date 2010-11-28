# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
require Rails.root.join('spec/spec_helper.rb')

def rand_range
  (1..(rand(20)+1))
end
(1..20).each do
  user = User.create(:email => Factory.next(:email), 
                     :blog_name => Factory.next(:title))
  puts "Added user: #{user.email}"
  rand_range.each do
    post = Post.create(:user => user, :title => Factory.next(:title),
                       :body => Factory.next(:body))
    puts "  Added post for #{user.email}: #{post.title}"
    rand_range.each do
      comment = Comment.create(:name => Factory.next(:name), 
                               :title => Factory.next(:title),
                               :comment => Factory.next(:comment))
      puts "    Added comment for #{post.title}: #{comment.title}"
    end
  end
end

