FactoryGirl.define do
  factory :post do
    title 'Title'
    content 'Content'
    ip_address '23.456.34.45'
    user nil
  end
end
