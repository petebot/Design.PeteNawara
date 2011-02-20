class Admin::Tool < ActiveRecord::Base
  validates_uniqueness_of :name, :case_sensitive => false
  validates_uniqueness_of :url, :case_sensitive => false, :allow_nil => true

  def to_param
    "#{id} #{name}".parameterize
  end
end
