class PostsController < ApplicationController
 before_action :sign_in_required, only: [:show]

  def index
    @posts = Post.all
  end

  def show
    @posts = Post.all
  end

  def detail
    @post = Post.find(params[:id])
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    if  @post.save
      redirect_to posts_show_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_show_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_show_path
  end

  private

   def post_params
     params.require(:post).permit(:title, :body)
   end

end
