class CommentsController < ApplicationController
  load_and_authorize_resource
  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.save
    redirect_to post_path(@comment.post)
  end

def destroy
  @comment.destroy
  respond_to do |format|
    format.html { redirect_to post_url, notice: 'Post was successfully destroyed.' }
    format.json { head :no_content }
  end
end

  def comment_params
  params.require(:comment).permit(:title, :body)
  end
end
