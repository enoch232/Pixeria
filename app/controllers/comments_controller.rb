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

		@comment = Comment.find(params[:id])
		@comment.destroy
		@gallery = Gallery.find(@comment.gallery_id)
		redirect_to gallery_path(@gallery)
		
	end
	private
	def comment_params
		params.require(:comment).permit(:gallery_id ,:body)
	end
end
