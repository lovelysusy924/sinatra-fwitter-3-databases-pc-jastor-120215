require_relative "../../config/environment.rb"

class Tweet < ActiveRecord::Base
  attr_accessor :user, :status
  
  ALL = []

  def initialize(user, status)
    @user = user
    @status = status
    ALL << self
  end

  # def user
  #   @user
  # end

  # def status
  #   @status
  # end

  def self.all
    ALL
  end
end