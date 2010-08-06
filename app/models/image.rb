class Image < ActiveRecord::Base
  # associations
  belongs_to :project

  # validations
  validates :title, :presence => true
  validates :url, :presence => true
  validates :project, :presence => true, :associated => true

  # callbacks
  before_save :check_default

  # named scopes
  scope :default, where('is_default = ?', true)

  # instance methods
  protected
    def check_default
      current_default = Image.where('project_id = ?', self.project.id).default.first
      return if current_default.nil? || current_default == self

      current_default.update_attributes(:is_default => false)
    end
end
