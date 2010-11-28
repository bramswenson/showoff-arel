# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :post do |f|
  f.user { 
    Factory.create(:user, :email => 'neo@matrix.com', :password => 'trinity1') 
  }
  f.title { Factory.next(:title) }
  f.body { Factory.next(:body) }
end
