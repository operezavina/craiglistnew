class PostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy, :edit]
  before_action :correct_user,   only: :destroy
  before_action :admin_user,     only: [:destroy]
  def index
    if !params[:category].nil?
      @posts = Post.where(category_id:params[:category][:category_id]).paginate(page: params[:page]).where(approved:nil)
    else
      @posts = Post.where(approved:nil).paginate(page: params[:page])
    end

  end
  def create
    @post = current_user.posts.build(post_params)
    @post.category_id = params[:category][:category_id]
    if @post.save
      flash[:success] = "post created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
  def edit
    @post = Post.find(params[:id])
  end
  def show
    @post = Post.find(params[:id])
    @response = Response.new
  end
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_url
  end

  private

  def post_params
    params.require(:post).permit(:content,:approved)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end


end