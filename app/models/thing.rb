class Thing < ActiveRecord::Base
  include Localization::Model

  scope :published, lambda { where(:state => :published) }
  scope :desc_by_date, lambda { order("date DESC") }

  state_machine :state, :initial => :hidden do
    state :published do
      with_options :if => :en do |v|
        v.validates :name_en, :presence => true, :uniqueness => true
        v.validates :summary_en, :presence => true
        v.validates :text_en, :presence => true
      end

      with_options :if => :ru do |v|
        v.validates :name_ru, :presence => true, :uniqueness => true
        v.validates :summary_ru, :presence => true
        v.validates :text_ru, :presence => true
      end
    end

    event :publish do
      transition :hidden => :published
    end

    event :hide do
      transition :published => :hidden
    end
  end
end
