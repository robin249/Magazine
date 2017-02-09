class CommentsController < ApplicationController
  def index

  end

  def new
    # @parent_id = params.delete(:parent_id)
    @commentable = find_commentable
    @comment = Comment.new( :commentable_id => @commentable.id,
                            :commentable_type => @commentable.class.to_s)
  end
  
  def create
    @commentable = find_commentable
    # binding.pry
    @comment = @commentable.comments.new comment_params
    
      if @comment.save
        redirect_to :back, notice: 'Your comment was successfully posted!'
      else
        redirect_to :back, notice: "Your comment wasn't posted!"
      end
  end
 
  private
  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

   def comment_params
      params.require(:comment).permit(:body)
    end
end