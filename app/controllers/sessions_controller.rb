class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_credentials(session_params[:user_name], session_params[:password])
    if user
      sign_in!(user)
      redirect_to root_url
    else
      flash.now[:errors] = ["Invalid username/password combination"]
    end
  end
  
  def destroy
    sign_out!
    redirect_to root_url
  end
  
  private
  def session_params
     params.require(:session).permit(:user_name, :password)
  end

end
