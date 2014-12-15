class Tweet
  attr_accessor :username, :status, :time_stamp
  
  ALL = []

  def initialize(username, status, time_stamp)
    @username = username
    @status = status
    @time_stamp = time_stamp
    ALL << self
  end

  # def username
  #   @username
  # end

  # def status
  #   @status
  # end

  def self.all
    ALL
  end
end