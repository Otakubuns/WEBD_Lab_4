class SessionsController < ApplicationController
  def destroy
    session[:userid] = nil
    redirect_to root_path, notice: "Successfully logged out"
  end


  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user.present? && user.authenticate(params[:password])
      session[:userid] = user.id
      redirect_to root_path, notice: "Successfully logged in"
    else
      flash[:alert] = "Invalid email or password"
      render :new, status: :unauthorized
    end
  end
end
