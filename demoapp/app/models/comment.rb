class Comment < ActiveRecord::Base
  belongs_to :post

  validates :name, :title, :comment, :post_id, :presence => true
end
