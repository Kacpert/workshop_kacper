class UsersController < ApplicationController
  def show
  	if current_user.reviews.any?
  		@reviews = current_user.reviews.sort_by &:created_at
  	end
  end
end
