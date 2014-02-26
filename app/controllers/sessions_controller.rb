class SessionsController < ApplicationController
  def new
    @words = Keyword.all
  end

  def create
    user = User.find_by username: params[:username]
    if user and user.authenticate params[:password]
      session[:user_id] = user.id
      redirect_to :ideas
    else
      redirect_to :back, notice: "User and/or password do not match!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end
end
