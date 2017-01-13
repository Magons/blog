class PostService
  def initialize(params)
    @params = params
  end

  def create
    find_or_create_ip_address
    user.posts.create(permit_post_params)
  end

  private

  def user
    @_user ||= User.find_or_create_by(permit_user_params)
  end

  def find_or_create_ip_address
    ip_address
    update_ip_address unless ip_address.users.include? user.login
  end

  def update_ip_address
    ip_address.users.push user.login
    ip_address.save
  end

  def ip_address
    @_ip_address ||= IpAddress.find_or_create_by(ip: @params[:post][:ip_address])
  end

  def permit_post_params
    @params.require(:post).permit(:title, :content, :ip_address)
  end

  def permit_user_params
    @params.require(:author).permit(:login)
  end
end
