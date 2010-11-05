# encoding: UTF-8

module FriendlyIdFinder

  def self.included(klass)
    klass.send(:extend, ClassMethods)
  end

  module ClassMethods
    def find_by_friendly_id(friendly_id)
      begin
        find(friendly_id)
      rescue ActiveRecord::RecordNotFound
        return nil
      end
    end
  end

end
