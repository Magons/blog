class PostsController < ApplicationController
  before_action :set_post, only: :vote

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
    VoteJob.perform_now(@post, params[:vote_value])
    render json: { average_rating: @post.average_rating }
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
