FactoryGirl.define do
  factory :content do
    en true
    alias_en { generate :random_string }
    text_en { generate :random_text }
    title_en { generate :random_string }
    ru true
    alias_ru { generate :random_string }
    text_ru { generate :random_text }
    title_ru { generate :random_string }

    factory :published_content do
      state :published
    end
  end
end
