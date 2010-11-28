
Factory.define :user do |f|
  f.email { Factory.sequence(:email) }
  f.password { random_chars }
end
