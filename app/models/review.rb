class Review < ActiveRecord::Base
  validates :content, :user_id, :rating, presence: true
  belongs_to :product
  belongs_to :user


   def author
  	user.firstname + " " + user.lastname 
  end

end
