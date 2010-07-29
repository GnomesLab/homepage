class Project < ActiveRecord::Base
  # Pagination
  cattr_reader :per_page
  @@per_page = 5

  # Named scopes
  scope :reverse, order('date desc')

  # Instance methods
  def date
    self[:date].strftime('%B, %d %Y')
  end
end
