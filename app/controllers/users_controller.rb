class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:displayed_image]

  def show
    #@user = current_user.username
    #@user = User.find(params[:id], user: current_user)
    @user = User.find(params[:id])
    @mood_board = current_user.mood_boards
    #render :show
    respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @user }
    end
  end

  def displayed_image
    if image_file.attached?
      image_file
    else
      "app/assets/images/Bear.jpg"
    end
  end

  def user_params
    params.require(:user).permit(:image_file)
  end


  def index 
    @users = User.all 
    render :index
  end

  def edit
    @user = current_user
    #@mood_boards = current_user.mood_boards
    render :edit
  end 

 def update
 @user = current_user
 if @user.update(params.require(:user).permit(:image_file, :about_me, :email))
  #@user.update_attributes(user_params)
    flash[:success] = "User successfully updated!"
    redirect_to current_user
    #redirect_to user_url(@user)
  else
    flash.now[:error] = "User update failed"
    render :edit
  end
 end



end # skip_before_action :authorized, only: [:new, :create]
=begin

private

    def user_params
      params.require(:user).permit(:about_me, :email)
    end
  def new
    @user = User.new
  end

  def index
    @users = User.all
    authorize User
end

def show
  @user = User.find(params[:id])
end

def sign_up
  end

  def create
    @user = User.create(params.require(:user).permit(:username,        
    :password))
    session[:user_id] = @user.id
    redirect_to '/mood_boards'
 end
 
end
=end 