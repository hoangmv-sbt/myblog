class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # before_action :authorize_user!, only: [:edit, :update, :destroy]
  after_action :verify_authorized, except: [:index, :show]

  def index
    @posts = Post.all
    authorize Post
  end

  def show
    # @post = Post.find(params[:id])
    authorize @post
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    authorize @post

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    # @post = Post.find(params[:id])
    authorize @post
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @post
    @post.destroy
    redirect_to posts_path, notice: 'Post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to posts_path, alert: 'Bài viết không tồn tại.' 
  end

  # def authorize_user!
  #   unless @post.author_id == current_user.id
  #     flash[:alert] = "Bạn không có quyền thực hiện hành động này."
  #     redirect_to posts_path
  #   end
  # end

  def post_params
    params.require(:post).permit(:title, :content, :photo, :author_id, :status, :image)
  end
end
