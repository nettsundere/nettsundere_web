class Repository < ActiveRecord::Base
  include Localization::Model

  has_many :commits, :dependent => :destroy

  scope :published, lambda { where(:state => :published) }
  scope :github, lambda { where(:source => :github) }

  state_machine :state, :initial => :hidden do
    state :published do
      validates :name, :presence => true
      validates :source, :presence => true
      validates :owner, :presence => true
      validates :author, :presence => true


      with_options :if => :en do |v|
        v.validates :summary_en, :presence => true
        v.validates :description_en, :presence => true
      end

      with_options :if => :ru do |v|
        v.validates :summary_ru, :presence => true
        v.validates :description_ru, :presence => true
      end
    end

    event :publish do
      transition :hidden => :published
    end

    event :hide do
      transition :published => :hidden
    end
  end

  def committed_changes
    commits.sum("additions + deletions").to_i
  end
end
