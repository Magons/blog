class PostsController < ApplicationController
  def index

  end

  def create
    @post = PostService.new(params).create
    if @post.valid?
      render json: @post
    else
      render error: @post.errors, status: :unprocessable_entity
    end
  end

  def vote

  end
end
