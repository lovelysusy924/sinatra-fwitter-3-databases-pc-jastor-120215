require_relative "../../config/environment"
require './app/models/tweet'

class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/tweets' do
    # Tweet.new("Vanessa", "My first tweet! SO EXCITING OMG!!!")
    # Tweet.new("Vanessa", "My second tweet! Still super exciting!!!")
    # Tweet.new("Vanessa", "A third tweet! ZOMG!!!")
    @tweets = Tweet.all
    erb :tweets
  end

  post '/tweets' do
    Tweet.new(params[:username], params[:status], params[:time_stamp])
    redirect '/tweets'
  end

end