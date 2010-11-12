# encoding: UTF-8

module FriendlyIdFinder

  def self.included(klass)
    klass.send(:extend, ClassMethods)
  end

  module ClassMethods

    def find_by_friendly_id(friendly_id)
      find_by_id friendly_id
    end

  end # ClassMethods

end # FriendlyIdFinder
