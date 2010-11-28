# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :post do |f|
  f.user_id 1
  f.title "MyString"
  f.slug "MyString"
  f.body "MyText"
end
