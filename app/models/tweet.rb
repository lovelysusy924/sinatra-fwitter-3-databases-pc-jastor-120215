class Tweet
  attr_accessor :username, :status, :time_stamp
  
  ALL_TWEETS = []

  def initialize(username, status, time_stamp)
    @username = username
    @status = status
    @time_stamp = time_stamp
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