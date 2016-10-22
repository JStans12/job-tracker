class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    @job = @comment.job
    redirect_to company_job_path(@job.company, @job)
  end

  private

  def comment_params
    params.require(:comment).permit(:job_id, :content)
  end

end
