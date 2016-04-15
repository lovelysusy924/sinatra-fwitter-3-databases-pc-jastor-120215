require './config/environment'
require './app/models/tweet'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @tweets = Tweet.all
    erb :index
  end

  get '/tweet' do
    erb :tweet
  end

  post '/tweet' do
  Tweet.create(:username => params[:username], :status => params[:status])
  redirect '/' 
end

end
