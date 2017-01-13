FactoryGirl.define do
  factory :post do
    title 'Title'
    content 'Content'
    ip_address '23.456.34.45'
    association :user, factory: :user
    average_rating 4.5
    factory :post_with_rating do
      after(:create) do |post|
        create(:rating, post: post)
        create(:rating_1, post: post)
      end
    end
  end

  factory :post_2, class: Post do
    title 'Title'
    content 'Content'
    ip_address '23.456.34.45'
    association :user, factory: :user
    average_rating 3.5
  end

  factory :post_3, class: Post do
    title 'Title'
    content 'Content'
    ip_address '23.456.34.46'
    association :user, factory: :user
    average_rating 2.5
  end

  factory :post_4, class: Post do
    title 'Title'
    content 'Content'
    ip_address '23.456.34.46'
    association :user, factory: :user
    average_rating 1.5
  end

  factory :post_5, class: Post do
    title 'Title'
    content 'Content'
    ip_address '23.456.34.47'
    association :user, factory: :user
    average_rating 0.5
  end
end
