class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all.order('created_at DESC').page(params[:page])
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private

    def post_params
      params.require(:post).permit(:title, :content)
    end

end
