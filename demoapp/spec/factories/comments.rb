
Factory.define :comment do |f|
  f.post { Factory.create(:post) }
  f.name { Factory.next(:name) }
  f.email { Factory.next(:email) }
  f.title { Factory.next(:title) }
  f.comment { Factory.next(:comment) }
end
