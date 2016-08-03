class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def require_login
    #check if the user is logged in or not
    unless logged_in?
      store_location
      flash[:danger] = "WOOF! Log in first. Woof! Woof!"
      redirect_to login_url(anchor: 'main') # halts request cycle
    end
  end

  def require_logout
    if logged_in?
      flash[:warning] = "Log out first."
      redirect_to root_url(anchor: 'main')
    end
  end

end
