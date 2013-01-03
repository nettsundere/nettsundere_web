class Thing < ActiveRecord::Base
  include Localization::Model

  with_options :if => :en do |v|
    v.validates :name_en, :presence => true
    v.validates :summary_en, :presence => true
    v.validates :text_en, :presence => true
  end

  with_options :if => :ru do |v|
    v.validates :name_ru, :presence => true
    v.validates :summary_ru, :presence => true
    v.validates :text_ru, :presence => true
  end
end
