require 'rails_helper'

RSpec.describe Rating, type: :model do
  subject {
    described_class.new(value: 1, post: FactoryGirl.create(:post))
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.value = 10
    expect(subject).to_not be_valid
  end
end
