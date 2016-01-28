class UsersController < ApplicationController

  get '/users/:id' do
    if !logged_in?
      redirect '/ideas'
    end

    @user = User.find(params[:id])
    if !@user.nil? && @user == current_user
      erb :'ideas/show'
    else
      redirect '/ideas'
    end
  end


  #signup
  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do 
    if params[:username] == "" || params[:password] == ""
      flash[:notice] = "You can't submit empty fields! Please try again!"
      redirect "/signup"
    else    
      @user = User.new(:username => params[:username], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
    end
      redirect to '/ideas'
  end

  #login
  get '/login' do 
    erb :'users/login'
  end 

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/ideas'
    else
      erb :error
    end
  end

    # LOGOUT
  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end