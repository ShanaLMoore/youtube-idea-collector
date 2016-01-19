class UsersController < ApplicationController

#signup
  get '/signup' do
    if logged_in?
      redirect '/ideas'
    else
      erb :'users/signup'
    end
  end

  post '/signup' do 
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.create(:username => params[:username], :password => params[:password])
      session[:user_id] = @user.id
      redirect to '/ideas'
    end
  end

#login
  get '/login' do 
    if logged_in?
      redirect '/ideas'
    else
      erb :'users/login'
    end
  end 

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user != nil && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect to '/ideas'
    end 
      erb :error
  end

  # LOGOUT
  get '/logout' do
    if logged_in?
      session.clear
      redirect '/login'
    else
      redirect '/'
    end
  end
end