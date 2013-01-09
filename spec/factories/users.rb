FactoryGirl.define do
  factory :user do
    
    login { generate :random_string }
    password { generate :random_string }

    factory :enabled_user do
      state :enabled
    end
  end
end
