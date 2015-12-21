class PostsController < ApplicationController
before_action :find_post, only: [:show, :edit, :destroy, :update]
before_filter :authenticate_admin, only: [:edit, :destroy, :update, :new, :update]

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
  end

  def index
    @posts = Post.all.order('created_at DESC').page(params[:page])
  end

  def destroy
    @post.delete
    redirect_to posts_path
    flash[:notice] = "News successfuly deleted."
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to posts_path
      flash[:success] = "News successfuly updated."
    else
      render 'edit'
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :content)
    end

    def find_post
      @post = Post.find(params[:id])
    end

    def authenticate_admin
      unless admin_signed_in?
        redirect_to root_path
        flash[:danger] = "Tylko administrator ma tu dostęp."
      end
    end

end
