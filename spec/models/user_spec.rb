require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(login: 'Nika')
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.login = nil
    expect(subject).to_not be_valid
  end
end
