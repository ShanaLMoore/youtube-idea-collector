class IdeasController < ApplicationController

#index
  get '/ideas' do
    if logged_in?
      @ideas = Idea.all
      erb :'ideas/index'
    else
      redirect '/login'
    end
  end

#new
  get '/ideas/new' do
    if logged_in?
      erb :'ideas/new'
    else
      redirect '/login'
    end
  end

  post '/ideas' do
    if !logged_in?
      erb :error
    else
      Idea.create(params)
      redirect "/ideas"
    end
  end

  #show
  get '/ideas/:id' do
    if logged_in?
      @ideas = Idea.all
      @idea = Idea.find_by_id(params[:id])
      erb :'ideas/show'
    else
      redirect '/login'
    end
  end

  #edit
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

  #detroy
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