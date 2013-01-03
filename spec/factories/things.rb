FactoryGirl.define do
  factory :thing do
  end

  factory :published_thing, :class => Thing do
    state :published
  end
end
