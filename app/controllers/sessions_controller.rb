class SessionsController < ApplicationController
  before_action :require_logout, only:    [ :new ]

  def new
  end

  def edit
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      # redirect to user page
      flash[:success] = "Yayzer logged in. Let\'s go pawers!"
      log_in(user)
      # helper to redirect to previous page
      redirect_back_or user_path(user, anchor: 'main')    # user automatically convered to route user_url(user)

    else
      #show error message
      flash.now[:danger] = 'Invalid email or password'
      render 'new'
    end
  end

  def update
    if current_user.update_attributes(permitted_user_params)
      flash[:success] = "Profile updated."
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end


  private
  def permitted_user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :mobile_number)
  end

end
