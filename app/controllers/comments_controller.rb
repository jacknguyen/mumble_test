class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = Comment.new(comment_params)
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.idea, notice: 'Comment was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user_name, :body, :idea_id)
    end
end
