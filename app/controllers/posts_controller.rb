class PostsController < ApplicationController

  def index
    @posts = Post.paginate(page: params[:page])
  end

  def new
    if admin_signed_in?
      @post = Post.new
    else
      flash[:error] = "Admin privilege is required to access that page"
      redirect_to root_url
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Successfully created a new post"
      redirect_to @post
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    if admin_signed_in?
      @post = Post.find(params[:id])
    else
      flash[:error] = "Admin privilege is required to access that page"
      redirect_to root_url
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
      flash[:notice] = "Successfully updated post"
    else
      render :edit
    end
  end

  def destroy
    if admin_signed_in?
      @post = Post.find(params[:id])
      @post.destroy
      flash[:notice] = "Successfully deleted post"
      redirect_to posts_path
    else
      flash[:error] = "Admin privilege is required to access that page"
      redirect_to root_url
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
