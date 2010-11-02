module TwitterProxy
  def self.get_tweets(user = 'gnomeslab', count = 4)
    begin
      Grackle::Client.new.statuses.user_timeline?(:user => user, :count => count)
    rescue
      nil
    end
  end
end