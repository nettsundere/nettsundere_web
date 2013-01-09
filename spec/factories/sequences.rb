FactoryGirl.define do
  sequence(:random_string) { |n| "string#{n}" }
  sequence(:random_text) { |n| "text#{n}" * 50 }
  sequence(:random_integer) { |n| n + 1 }
end
