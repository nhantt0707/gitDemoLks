class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
        flash[:success] = "Comment created!"
    end
    redirect_to :back
  end

    def destroy
      @comment.destroy
      flash[:success] = "Comment deleted!"
      redirect_to request.referrer || micropost_url
    end

  private

    def comment_params
    params.require(:comment).permit(:content, :micropost_id)
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to micropost_url if @comment.nil?
    end
end
