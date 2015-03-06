class ReviewDecorator < Draper::Decorator
  delegate_all

  def author
  	user.firstname + " " + user.lastname 
  end

end
