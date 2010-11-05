# encoding: UTF-8

module TwitterProxy
  def self.get_tweets(user = 'gnomeslab', count = 3)
    begin
      Grackle::Client.new.statuses.user_timeline?(:user => user, :count => count, :include_rts => true)
    rescue
      nil
    end
  end
end