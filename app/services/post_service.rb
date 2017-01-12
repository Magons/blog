class PostService
  def initialize(params)
    @params = params
  end

  def create
    validates_presence_params
    user.posts.create(permit_post_params)
  end

  private

  def user
    User.find_or_create_by(permit_user_params)
  end

  def validates_presence_params
    validates_presence_title
    validates_presence_content
  end

  def validates_presence_title
    return if @params[:post][:title].present?
    raise "Title can't be blank"
  end

  def validates_presence_content
    return if @params[:post][:content].present?
    raise "Content can't be blank"
  end

  def permit_post_params
    @params.require(:post).permit(:title, :content)
  end

  def permit_user_params
    @params.require(:author).permit(:login)
  end
end
