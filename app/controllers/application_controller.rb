class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def headshot_post_save(file_path)
  	p "*" * 50
		p file_path
	end
end
