require './config/environment'
require './app/models/tweet'
require 'pry' #pry is a VERY useful gem for debugging. By requiring it here, we can freeze at any point during our applicaiton by using binding.pry

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    # Because we now have a form that let's users submit their own tweets, we can comment out the ones we hard-coded yesterday.
    # Tweet.new("Vanessa", "My first tweet! SO EXCITING OMG!!!")
    # Tweet.new("Vanessa", "My second tweet! Still super exciting!!!")
    # Tweet.new("Vanessa", "A third tweet! ZOMG!!!")
    @tweets = Tweet.all
    erb :index
  end

  # The get 'tweet' action will display our form for them to enter a username and status for their tweet. 
  get '/tweet' do
    erb :tweet
  end

  # Submitting the form in the 'tweet.erb' file takes us here, because the form has a method of "post" and an action of "/tweet". 
  post '/tweet' do
    # We can access the data a user submitted in the params hash. The keys in params are defined by the name of our form. 
    Tweet.new(params[:username], params[:status]) #We create a new instance of our Tweet class.
    redirect '/' # And re-direct to the home page. 
  end

end
