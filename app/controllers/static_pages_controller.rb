class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @post  = current_user.posts.build
      @posts = Post.where(approved:true).paginate(page: params[:page])
    else
      @posts = Post.where(approved:true).paginate(page: params[:page])
    end
  end
  def buscar
    @posts = Post.where(:category_id,params[:category_id])
    redirect_to root_path
  end

  def help
  end

  def about
  end

  def _contact

  end
end