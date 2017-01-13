class PostService
  def initialize(params)
    @params = params
  end

  def create
    user.posts.create(permit_post_params)
  end

  private

  def user
    User.find_or_create_by(permit_user_params)
  end

  def permit_post_params
    @params.require(:post).permit(:title, :content, :ip_address)
  end

  def permit_user_params
    @params.require(:author).permit(:login)
  end
end
