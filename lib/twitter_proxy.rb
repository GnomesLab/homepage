# encoding: UTF-8

require 'singleton'

class TwitterProxy
  include Singleton

  def initialize
    @grackle = Grackle::Client.new
  end

  def get_tweets(user = 'gnomeslab', count = 3)
    begin
      @grackle.statuses.user_timeline?(:user => user, :count => count, :include_rts => true)
    rescue
      nil
    end
  end
end