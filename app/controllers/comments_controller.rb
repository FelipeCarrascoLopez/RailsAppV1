class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ destroy ]
  before_action :same_user?, only: %i[destroy]

  def create
    @comment = current_user.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to article_path(@comment.article_id), notice: "Comment was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to article_path(@comment.article_id), notice: "Comment was successfully destroyed." }
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:text, :article_id)
    end

    def same_user?
      redirect_to articles_path if @comment.user != current_user
    end
end
