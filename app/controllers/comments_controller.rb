class CommentsController < ApplicationController
  before_action :set_post

  def create
  	comment = @post.comments.create! comment_params
    CommentsMailer.submitted(comment).deliver_later
    CommentsChannel.broadcast(comment)
  	redirect_to @post
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url, notice: 'Comment was successfully destroyed.' }
    end
  end
  
  private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
  	params.require(:comment).permit(:body)
  end
end
