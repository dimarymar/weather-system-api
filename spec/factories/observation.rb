FactoryGirl.define do
  facory :observation do
    sequence(:temperature) { |n| n }
    sequence(:pressure) { |n| n }
    sequence(:humidity) { |n| n }
  end
end
