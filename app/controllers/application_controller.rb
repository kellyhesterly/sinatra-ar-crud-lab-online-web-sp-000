require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    @article = Article.new(params)
    erb :new
  end

  post '/articles' do
    @article = Article.create(params)
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find_by(params[:id])
    redirect to "/articles/#{@article.id}"
  end
end
