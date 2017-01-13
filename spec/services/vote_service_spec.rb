require 'rails_helper'

RSpec.describe VoteService, :type => :service do
  subject { VoteService.new(post, 2).vote }

  let(:post) { FactoryGirl.create(:post_with_rating) }

  describe 'vote for post' do
    it 'returns average rating' do
      expect(subject).to eq 2.67
    end
  end
end
