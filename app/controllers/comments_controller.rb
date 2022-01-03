class CommentsController < ApplicationController
    before_action :authenticate_user!, except: [:new, :create]

    def index
        @moodboard = MoodBoard.find(params[:moodboard_id])
        @comments = @moodboard.comments
        render :index
      end

    def new
        @mood_board = MoodBoard.find(params[:moodboard_id])
        @comment = @mood_board.comments.new
        render :new
    end

    def create
        @mood_board = MoodBoard.find(params[:moodboard_id])
        @comment = @mood_board.comments.build(params.require(:comment).permit(:message))
        if current_user
            @comment.user = current_user
            @comment.save!
        end
        if @comment.save
            flash[:success] = "New comment posted!"
            redirect_to mood_board_url(@mood_board)
        else
            puts @comment.errors.full_messages
            flash.now[:error] = "Error: Comment wasn't posted."
            render :new
        end
    end

    def destroy
        @moodboard = MoodBoard.find(params[:moodboard_id])
        @comment = @moodboard.comments.find(params[:id])
        @comment.destroy
        flash[:success] = "The comment has been deleted."
        redirect_to mood_board_url(@moodboard)
    end
end
