class Tweet
  attr_accessor :username, :status
  
  ALL_TWEETS = []

  def initialize(username, status)
    @username = username
    @status = status
    ALL_TWEETS << self
  end


  # def username
  #   @username
  # end

  # def status
  #   @status
  # end

  def self.all
    ALL_TWEETS
  end
end