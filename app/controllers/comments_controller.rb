class CommentsController < ApplicationController

	# add a comment to the story - a new page for comment

	def new

		# so not params[:id] as this would refer to a comment 
		# we need to find the story by the story_id

		@story = Story.find(params[:story_id]) 

		# find the story and make a new comment on that story 

		@comment = @story.comments.new

	end

	# actually get the form data and create a comment

	def create

		@story = Story.find(params[:story_id]) 

		@comment = @story.comments.new(comment_params)

		if @comment.save 

			# a flash to tell the user they've added a comment

			flash[:success] = "You've added your comment"

			# go back to story page

			redirect_to story_path(@story)

		else

			# if they haven't passed the validation send them back to new comment

			render "new"

		end

	end

	# lets make a shortcut for grabbing the comment form data
	# this is our whitelist for our form data

	def comment_params

		params.require(:comment).permit(:body)

	end



end
