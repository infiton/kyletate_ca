class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      flash[:success] = "Post created"
      redirect_to root_path
    else
      flash[:danger] = @post.errors.full_messages.to_sentence
      redirect_to :back and return
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:success] = "Post updated"
      redirect_to root_path
    else
      flash[:danger] = @post.errors.full_messages.to_sentence
      redirect_to :back and return
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:success] = "Post deleted"
      redirect_to root_path
    else
      flash[:danger] = @post.errors.full_messages.to_sentence
      redirect_to :back and return
    end
  end

  private
    def post_params
      params.require(:post).permit(:title,:body)
    end
end