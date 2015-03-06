class Review < ActiveRecord::Base
  validates :content, :user_id, :rating, presence: true
  belongs_to :product
  belongs_to :user
end
