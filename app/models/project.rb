class Project < ActiveRecord::Base
  belongs_to :client
  has_many :projects_tools
  has_many :tools, :through => :projects_tools

  validates_presence_of   :title
  validates_presence_of :priority

  before_save :reorder_priorities
  after_destroy :remove_priority

  after_initialize :default_priority

  def to_param
    "#{id} #{title}".parameterize
  end

  private

    def default_priority
      self[:priority] ||= 1
    end

    def reorder_priorities
      return unless priority_changed?
      old_priority = priority_was
      if new_record?
        Project.update_all("priority = priority + 1", ["priority >= ?", priority])
      elsif priority < old_priority
        Project.update_all("priority = priority + 1", ["priority >= ? AND priority < ?", priority, old_priority])
      elsif priority > old_priority
        Project.update_all("priority = priority - 1", ["priority <= ? AND priority > ?", priority, old_priority])
      end
    end

    def remove_priority
      Project.update_all("priority = priority - 1", ["priority > ?", priority])
    end
end
