class User < ActiveRecord::Base
  has_many :posts, :dependent => :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable

  attr_accessible :email, :password, :password_confirmation, :remember_me
end
