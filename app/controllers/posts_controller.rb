class PostsController < ApplicationController
  before_action :set_post, only: :vote
  before_action :add_ip_address_to_params, only: :create

  def index
    @posts = Post.order(average_rating: :desc).first(params[:quantity])
    render json: @posts
  end

  def create
    @post = PostService.new(params).create
    if @post.valid?
      render json: @post.as_json
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def vote
    VoteService.new(@post, params[:vote_value]).vote
    render json: { average_rating: @post.average_rating }
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def add_ip_address_to_params
    params[:post][:ip_address] = request.remote_ip
  end
end
