class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    respond_to do |format|
      format.html { redirect_to article_path(@article), notice: 'Comment added!' }
      format.js {}
    end
  end
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

    @comment.destroy
    respond_to do |format|
      format.html { redirect_to article_path(@article), notice: 'Comment deleted!' }
      format.js {}
    end
    #
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter,  :body)
  end
end
