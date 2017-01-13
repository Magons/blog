FactoryGirl.define do
  factory :rating do
    value 2
    association :post, factory: :post
  end
  factory :rating_1, class: Rating do
    value 4
    association :post, factory: :post
  end
end
