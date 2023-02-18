class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article
  
  def create
    @comment = @article.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to article_path(@article),
      notice: "Comment added"
    else
      redirect_to article_path(@article),
      notice: "Couldn't create comment"
    end
  end
  
  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article),
    notice: "Comment deleted"
  end
  
  private
  def comment_params
    params.require(:comment).permit(:name, :body)
  end
  def set_article
    @article = Article.find(params[:article_id])
  end
end
