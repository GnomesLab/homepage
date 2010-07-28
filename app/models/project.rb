class Project < ActiveRecord::Base
  # Pagination
  cattr_reader :per_page
  @@per_page = 5

  # Named scopes
  scope :recent, order('date desc')
end
