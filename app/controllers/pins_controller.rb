class PinsController < ApplicationController
    before_action :authenticate_user!, except: [:show]

    def index
        @moodboard = MoodBoard.find(params[:moodboard_id])
        @pins = @moodboard.pins
        render :index
      end

    def show
        @moodboard = MoodBoard.find(params[:moodboard_id])
        @pin = @moodboard.pins.find(params[:id])
        if current_user
            @moodboards = current_user.mood_boards
        end
        if current_user
            @editing_mb
            @mbs = current_user.mood_boards
            @mbs.each do |f|
                if f.editing == true
                    @editing_mb = MoodBoard.find(f.id)
                end
            end
        end
        render :show
    end

    def editing
        if current_user
            @editing_mb
            @mbs = current_user.mood_boards
            @mbs.each do |f|
                if f.editing == true
                    @editing_mb = MoodBoard.find(f.id)
                end
            end
        end
        @pin = Pin.find(params[:id])
        @repin = Pin.new
        @repin.pin_name = @pin.pin_name
        @repin.hovertext = @pin.hovertext
        @repin.image_file.attach(@pin.image_file.blob)
        @repin.mood_board = @editing_mb
        @repin.save
        redirect_to mood_board_pins_url(@editing_mb)
    end

    def grab
        @moodboards = current_user.mood_boards
        @pin = Pin.find(params[:id])
        render :grab
    end

    def repin
        @pin = Pin.find(params[:id])
        @repin = Pin.new
        @repin.pin_name = @pin.pin_name
        @repin.hovertext = @pin.hovertext
        @repin.image_file.attach(@pin.image_file.blob)
        @repin.update(params.require(:pin).permit(:pin_name, :hovertext, :image_file, :mood_board_id))
        redirect_to mood_board_pins_url(@repin.mood_board)
    end

    
    def new
        @moodboard = MoodBoard.find(params[:moodboard_id])
        @pin = Pin.new
        render :new
    end

    def create
        @moodboard = MoodBoard.find(params[:moodboard_id])
        @pin = @moodboard.pins.build(params.require(:pin).permit(:pin_name, :hovertext, :image_file))
        if @pin.save
            flash[:success] = "New pin created!"
            redirect_to mood_board_pins_url(@moodboard)
        else
            flash.now[:error] = "Pin creation failed."
            render :new
        end
    end

    def edit
        @moodboard = MoodBoard.find(params[:moodboard_id])
        @pin = @moodboard.pins.find(params[:id])
        render :edit
    end

    def update
        @moodboard = MoodBoard.find(params[:moodboard_id])
        @pin = @moodboard.pins.find(params[:id])
        if @pin.update(params.require(:pin).permit(:pin_name, :hovertext, :image_file))
          flash[:success] = "Pin updated!"
          redirect_to mood_board_pin_url(@moodboard, @pin)
        else
          flash.now[:error] = "Pin update failed"
          render :edit
        end
    end

    def destroy
        @moodboard = MoodBoard.find(params[:moodboard_id])
        @pin = @moodboard.pins.find(params[:id])
        @pin.destroy
        flash[:success] = "The pin has been deleted."
        redirect_to mood_board_pins_url(@moodboard)
    end

end
