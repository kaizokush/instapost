class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :is_owner?, only: [:edit,:update]
  def create
    @post = current_user.posts.create(post_params)
    if @post.valid?
        flash[:error] = "You must be logged in to access this section"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @post=Post.find(params[:id])
  end
  def index
    @posts = Post.all.order('created_at DESC')
  end
  def new
    @post=Post.new
  end
  def update
    @post=Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path
    else
      redirect_to edit_post_path(params[:id])
    end
  end

  private

  def is_owner?
    redirect_to root_path if Post.find(params[:id]).user!=current_user
    end
  end
  def post_params
    params.require(:post).permit(:user_id,:photo,:description)
  end
