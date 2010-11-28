
Factory.define :post do |f|
  f.user { Factory.create(:user) }
  f.title { Factory.next(:title) }
  f.body { Factory.next(:body) }
end
