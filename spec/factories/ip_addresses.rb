FactoryGirl.define do
  factory :ip_address do
    ip '123.45.23.5'
    users ['Sam', 'Kevin']
  end

  factory :ip_address_2, class: IpAddress do
    ip '123.45.23.56'
    users ['Deric']
  end

  factory :ip_address_3, class: IpAddress do
    ip '123.45.23.58'
    users ['Carry', 'Jhon', 'Samanta']
  end
end
