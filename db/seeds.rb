require "#{Rails.root}/db/seeds/array_of_names.rb"

puts 'Creating posts. Please wait...'

200_000.times do |i|
  params = ActionController::Parameters.new({
    post: {
      title: "Test #{i}",
      content: "Test content #{i}",
      ip_address: "34.18.142.#{i/4000}"
    },
    author: {
      login: @names[i/2000]
    }
  })

  # create posts and authors

  PostService.new(params).create

  # voting

  if i > 180_000
    post = Post.first(2000).sample
    vote_value = Rating::AVALIABLE_VOTE_VALUES.sample
    VoteService.new(post, vote_value).vote
  end
end
