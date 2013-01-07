FactoryGirl.define do
  factory :banner do
    ru true
    en true

    message_ru { generate :random_text }
    message_en { generate :random_text }

    factory :published_banner do
      state :published
    end
  end
end
