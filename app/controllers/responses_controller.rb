class ResponsesController < ApplicationController


  def create
    #@post = Post.find(post_params[:id])
    @response = Response.new(response_params)
    if @response.save
      flash[:success] = "Response created!"
      redirect_to @response.post.user
    else
      @feed_items = []
      render 'users#show'
    end
  end
  private

  def response_params
    params.require(:response).permit(:content_visitor,:email_visitor,:post_id)
  end
end