class Commit < ActiveRecord::Base
  scope :by_id, lambda { order("id ASC") }

  belongs_to :repository

  validates :repository, :presence => true

  validates :scmid, :presence => true
  validates :time, :presence => true

  validates :deletions, :presence => true
  validates :additions, :presence => true

  validates :message, :presence => true

  validates :time, :presence => true
end
