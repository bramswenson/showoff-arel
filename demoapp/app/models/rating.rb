class Rating < ActiveRecord::Base
  belongs_to :rater, :class_name => 'User'
  belongs_to :post

  validates :rater_id, :presence => true
  validates :post_id, :presence => true
  validates :post_id, :uniqueness => { :scope => :rater_id }
  validates :rating, :presence => true
  validates :rating, :numericality => { :greater_than => 0, :less_than => 6 }
end
