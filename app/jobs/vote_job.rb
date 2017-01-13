class VoteJob < ApplicationJob
  queue_as :default

  def perform(post, vote_value)
    VoteService.new(post, vote_value).vote
  end
end
