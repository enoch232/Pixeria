class CommentsController < ApplicationController
	def create
		@gallery = Gallery.find(params[:gallery_id])
		@comment = @gallery.comments.new(comment_params)
		@comment.user = current_user
		if @comment.save
			redirect_to gallery_path(@gallery)
		else
			render :back
		end
	end
	def destroy
	end
	private
	def comment_params
		params.require(:comment).permit(:body)
	end
end
