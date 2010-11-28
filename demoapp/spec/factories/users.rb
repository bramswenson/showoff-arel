
Factory.define :user do |f|
  f.email { Factory.next(:email) }
  f.password { random_chars }
end
