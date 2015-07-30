class CommentsController < ApplicationController
  def create
    post = Post.find(params[:comment][:post_id])
    @comment = post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.valid?
      @comment.save
      flash[:notice] = "Successfully created comment"
      redirect_to :back
    else
      flash.now[:danger] = "Unable to create comment. Please try again"
      render 'posts#show'
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :user_id, :post_id)
    end
end
