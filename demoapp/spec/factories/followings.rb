
Factory.define :following do |f|
  f.followed { Factory.create(:user) }
  f.follower { Factory.create(:user) }
end
