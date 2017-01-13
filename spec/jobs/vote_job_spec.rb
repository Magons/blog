require "rails_helper"

RSpec.describe VoteJob do
  let!(:post) { FactoryGirl.create(:post) }
  it 'matches with enqueued job' do
    expect {
      VoteJob.perform_later(post, 3)
    }.to have_enqueued_job.with(post, 3)
  end
end
