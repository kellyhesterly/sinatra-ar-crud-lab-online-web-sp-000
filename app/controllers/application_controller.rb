require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
#CREATE
  get '/articles/new' do
    @article = Article.new
    erb :new
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  #READ


  get '/articles/:id' do
    @article = Article.find_by(params[:id])
    erb :show
  end



end
