class VoteService
  def initialize(post, vote_value)
    @post = post
    @vote_value = vote_value
  end

  def vote
    update_average_rating if create_rating
  end

  private

  def create_rating
    @post.ratings.create(value: @vote_value)
  end

  def calcualte_average_rating
    @average_rating ||= vote_values.inject(0.0) { |sum, value| sum + value } / vote_values.size
  end

  def update_average_rating
    @post.with_lock do
      @post.update(average_rating: calcualte_average_rating)
    end
    calcualte_average_rating.round(2)
  end

  def vote_values
    @_vote_values ||= @post.ratings.map(&:value)
  end
end
