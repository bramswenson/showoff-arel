class User < ActiveRecord::Base
  has_many :posts, :dependent => :destroy

  validates :blog_name, :presence => true, :uniqueness => true

  acts_as_url :blog_name, :url_attribute => :blog_slug, :sync_url => true, 
    :only_when_blank => true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable

  attr_accessible :email, :password, :password_confirmation, :remember_me
end
