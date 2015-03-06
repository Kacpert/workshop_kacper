class Product < ActiveRecord::Base
	validates :description, :price, :title, presence: true
	validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }
  belongs_to :category
  belongs_to :user
  has_many :reviews


  def average_rating
  	i = 0
  	sum = reviews.to_a.sum{ |rev| rev.rating }
  	reviews.each{ i += 1.0 }
  	sum/i
  end
end
