FactoryGirl.define do
  factory :commit do
    scmid { generate :random_string }
    message { generate :random_text }

    additions { generate :random_integer }
    deletions { generate :random_integer }

    time { Time.now }
  end
end
