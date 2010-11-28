class Post < ActiveRecord::Base
  belongs_to :user
  
  validates :title,   :presence => true, :uniqueness => true
  validates :user_id, :presence => true
  validates :body,    :presence => true

  acts_as_url :title, :url_attribute => :slug, :sync_url => true, 
    :only_when_blank => true

end
