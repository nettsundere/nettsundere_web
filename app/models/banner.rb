class Banner < ActiveRecord::Base
  include Localization::Model

  scope :published, lambda { where(:state => :published) }

  state_machine :state, :initial => :hidden do
    state :published do
      with_options :if => :en do |v|
        v.validates :message_en, :presence => true
      end

      with_options :if => :ru do |v|
        v.validates :message_ru, :presence => true
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
