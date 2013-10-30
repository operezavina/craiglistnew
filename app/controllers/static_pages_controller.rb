class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @post  = current_user.posts.build
      if !params[:category].nil?
        @posts = Post.where(category_id:params[:category][:category_id]).paginate(page: params[:page]).where(approved:true)
      else
        @posts = Post.where(approved:true).paginate(page: params[:page])
      end

    else
      if !params[:category].nil?
      @posts = Post.where(category_id:params[:category][:category_id]).paginate(page: params[:page]).where(approved:true)
      else
        @posts = Post.where(approved:true).paginate(page: params[:page])
      end
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