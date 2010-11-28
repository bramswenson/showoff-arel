class User < ActiveRecord::Base
  has_many :posts,       :dependent => :destroy
  has_many :ratings,     :dependent => :destroy, :foreign_key => :rater_id
  has_many :posts_rated, :through => :ratings, :source => :post

  validates :blog_name, :presence => true, :uniqueness => true
  
  before_validation :titleize_blog_name

  acts_as_url :blog_name, :url_attribute => :blog_slug, :sync_url => true, 
    :only_when_blank => true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  private
    def titleize_blog_name
      self.blog_name = self.blog_name.titleize unless self.blog_name.blank?
    end
end
