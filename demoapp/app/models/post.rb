class Post < ActiveRecord::Base
  belongs_to :user
  has_many   :comments, :dependent => :destroy
  has_many   :ratings,  :dependent => :destroy
  has_many   :raters, :through => :ratings, :source => :rater
  
  validates :title,   :presence => true, :uniqueness => true
  validates :user_id, :presence => true
  validates :body,    :presence => true

  before_validation :titleize_title

  acts_as_url :title, :url_attribute => :slug, :sync_url => true, 
    :only_when_blank => true

  private
    def titleize_title
      self.title = self.title.titleize unless self.title.blank?
    end
end
