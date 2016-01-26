class IdeasController < ApplicationController

#index
  get '/ideas' do
      @ideas = Idea.all
      erb :'ideas/index'
  end

#NEW IDEA
  get '/ideas/new' do
      erb :'ideas/new'
  end

  post '/ideas' do
    if !logged_in?
      erb :error
    else
      Idea.create(params)
      redirect "/ideas"
    end
  end

  #SHOW IDEA
  get '/ideas/:id' do
    if logged_in?
      @ideas = Idea.find(params[:id])
      erb :'ideas/show'
    else
      redirect '/login'
    end
  end

  #EDIT IDEA
  get '/ideas/:id/edit' do
    if logged_in?
      @idea = Idea.find_by_id(params[:id])
      erb :'ideas/edit'
    else
      redirect '/login'
    end
  end

  post '/ideas/:id' do
    if logged_in?
      @idea = Idea.find_by_id(params[:id])
      @idea.update(:name => params[:name], :content => params[:content])
      redirect '/ideas'
    else
      redirect '/login'
    end
  end

  #DELETE IDEA
  post '/ideas/:id/delete' do
    if logged_in?
      @idea = Idea.find_by_id(params[:id])
      @idea.delete
      redirect '/ideas'
    else
      redirect '/login'
    end
  end

end