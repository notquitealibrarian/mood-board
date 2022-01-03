class MoodboardsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @mood_boards = MoodBoard.order(global_rating: :desc)
        render :index
    end

    def show
        @mood_board = MoodBoard.find(params[:id])
        render :show
    end

    def new
        @mood_board = MoodBoard.new
        render :new
    end

    def edit
        @mood_board = MoodBoard.find(params[:id])
        render :edit
       end 

    def create
        @mood_board = MoodBoard.new(params.require(:mood_board).permit(:title, :template))
        @mood_board.user = current_user
        if @mood_board.save
            flash[:success] = 'Moodboard was successfully created!'
            redirect_to mood_board_url(@mood_board)
        else 
            flash.now[:error] = 'Error! Unable to create moodboard.'
            render :new
        end
    end

    def update
        @mood_board = MoodBoard.find(params[:id])
        if @mood_board.update(params.require(:mood_board).permit(:title, :template, :editing, :featured))
          flash[:success] = "MoodBoard successfully updated!"
          redirect_to mood_boards_url(@mood_board)
        else
          flash.now[:error] = "MoodBoard update failed"
          render :edit
        end
      end
    # def acceptable_image
    #     return unless photo.attached?

    #     unless photo.byte_size <= 1.megabyte
    #         errors.add(:photo, "This file is too large.")
    #     end

    #     unless accetable_types = ["image/jpeg", "image/jpg", "image/png"]
    #     errors.add(:photo, "Invalid Format! Image must be JPEG, JPG, or PNG.")
    #     end
    # end
    

    def destroy
        @mood_board = MoodBoard.find(params[:id])
        @mood_board.destroy
        flash[:success] = 'Mood Board successfully destroyed.'
        redirect_to mood_boards_url
    end

    def rate
        @mood_board = MoodBoard.find(params[:id])
        Rating.create(user: current_user, mood_board: @mood_board)
        @mood_board.increment!(:global_rating)
        @mood_board.save
        redirect_to mood_board_url(@mood_board)
    end


    def getinspired
        @mood_board = MoodBoard.find(params[:id])
        @new_mood_board = MoodBoard.dup
        redirect_to mood_board_url(@new_mood_board)
    end
end
