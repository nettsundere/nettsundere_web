class Content < ActiveRecord::Base
  include Localization::Model

  scope :published, lambda { where(:state => :published) }

  state_machine :state, :initial => :hidden do
    state :published do
      
      validates :symbolic_name, :presence => true, :uniqueness => true

      with_options :if => :en do |v|
        v.validates :alias_en, :presence => true, :uniqueness => true
        v.validates :title_en, :presence => true
        v.validates :text_en, :presence => true
      end

      with_options :if => :ru do |v|
        v.validates :alias_ru, :presence => true, :uniqueness => true
        v.validates :title_ru, :presence => true
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
