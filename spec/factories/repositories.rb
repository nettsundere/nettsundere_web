FactoryGirl.define do
  factory :repository do
    ru true
    en true

    name { generate :random_string }
    source { generate :random_string }

    description_ru { generate :random_text }
    description_en { generate :random_text }

    summary_ru { generate :random_text }
    summary_en { generate :random_text }

    after(:create) do |n| 
      [
        create(:commit, :repository => n),
        create(:commit, :repository => n) 
      ] 
    end

    factory :published_repository do
      state :published
    end
  end
end
