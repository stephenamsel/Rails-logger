class SessionController < ApplicationController
  def homepage
  end
  
  def login
    user = User.find_by(name: params[:user][:name])
    
    if user && user.authenticate(params[:user][:password]) then
      log_in(user)
      redirect_to loans_path
    else
      redirect_to root_path, notice: "Invalid name / password combination"
    end
  end
  
  def logout
    log_out
    redirect_to root_url
  end
  
  def new
    User.create(name: params[:user][:name], password: params[:user][:password])
    login
  end
end
