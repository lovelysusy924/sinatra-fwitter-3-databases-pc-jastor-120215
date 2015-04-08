require './config/environment'
require './app/models/tweet'
require 'pry'

class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    # Tweet.new("Vanessa", "My first tweet! SO EXCITING OMG!!!")
    # Tweet.new("Vanessa", "My second tweet! Still super exciting!!!")
    # Tweet.new("Vanessa", "A third tweet! ZOMG!!!")
    @tweets = Tweet.all
    erb :index
  end

  get '/tweets' do
    erb :tweets 
  end
  
  post '/tweets' do
    # puts params
    # binding.pry
    Tweet.new(params[:username], params[:status])
    redirect_to '/'
  end

end