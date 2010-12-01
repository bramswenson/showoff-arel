class User < ActiveRecord::Base
  has_many :posts,       :dependent => :destroy
  has_many :ratings,     :dependent => :destroy, :foreign_key => :rater_id
  has_many :posts_rated, :through => :ratings, :source => :post
  has_many :source_followings,  :dependent => :destroy, :class_name => 'Following', :foreign_key => :follower_id
  has_many :target_followings,  :dependent => :destroy, :class_name => 'Following', :foreign_key => :followed_id
  has_many :following,   :through => :source_followings, :source => :followed
  has_many :followers,   :through => :target_followings, :source => :follower

  validates :blog_name, :presence => true, :uniqueness => true
  
  before_validation :titleize_blog_name

  acts_as_url :blog_name, :url_attribute => :blog_slug, :sync_url => true, 
    :only_when_blank => true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :blog_name

  scope :from_domain_sql, lambda { |domain|
    where("users.email ILIKE ?", "%#{domain}%")
  }

  scope :from_domain_arel, lambda { |domain|
    where(arel_table[:email].matches("%#{domain}%"))
  }

  private
    def titleize_blog_name
      self.blog_name = self.blog_name.titleize unless self.blog_name.blank?
    end
end
