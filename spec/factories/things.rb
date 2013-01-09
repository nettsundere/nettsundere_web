FactoryGirl.define do
  factory :thing do

    ru true
    en true

    name_ru { generate :random_string }
    name_en { generate :random_string }

    text_ru { generate :random_text }
    text_en { generate :random_text }

    summary_ru { generate :random_text }
    summary_en { generate :random_text }

    date { Time.now }

    factory :published_thing do
      state :published
    end
  end
end
