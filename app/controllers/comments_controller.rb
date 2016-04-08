class CommentsController < ApplicationController
	def create
		@gallery = Gallery.find(params[:gallery_id])
		@comment = @gallery.comments.new(comment_params)
		@comment.user = current_user
		if @comment.save
			respond_to do |format|
				format.html{redirect_to gallery_path(@gallery)}
				format.js
			end

		else
			render :back
		end
	end
	def destroy

		@comment = Comment.find(params[:id])
		@comment.destroy
		@gallery = Gallery.find(@comment.gallery_id)
		respond_to do |format|
			format.html{redirect_to gallery_path(@gallery)}
			format.js
		end
		
	end
	private
	def comment_params
		params.require(:comment).permit(:gallery_id ,:body)
	end
end
