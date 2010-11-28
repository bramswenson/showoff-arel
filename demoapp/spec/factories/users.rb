
Factory.define :user do |f|
  f.email { Factory.next(:email) }
  f.password { random_chars }
  f.blog_name { Factory.next(:title) }
end
