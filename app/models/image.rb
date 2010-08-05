class Image < ActiveRecord::Base
  # associations
  belongs_to :project

  # validations
  validates :title, :presence => true
  validates :url, :presence => true
  validates :project, :presence => true, :associated => true
end
