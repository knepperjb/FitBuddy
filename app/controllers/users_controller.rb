class UsersController < ApplicationController
  
  before_action :authenticate_user!
  def home
    @user = User.find(current_user.id)
    @messages = Message.where(target_id: @user.id)
    @count = []
    if @messages
      @messages.entries.each do |message|
        if !message.read
          @count.push(message)
        end
      end
    end
    @x = @count.length
  end

  def location
    @user = User.find(current_user.id)
  end

  skip_before_action :verify_authenticity_token

  def set_location
    user = User.find(current_user.id)
    user.lat = params[:lat]
    user.lng = params[:lng]
    user.save
    redirect_to '/'
  end

  def set_goal
    goal = params[:goal]
    user = User.find(current_user.id)
    user.goal = goal
    user.save
    redirect_to :back
  end

  def set_location_button
    user = User.find(current_user.id)
    user.lat = params[:lat]
    user.lng = params[:lng]
    user.save
    redirect_to :back
  end

  def find_friends
    user = User.find(current_user.id)
    @friends = User.within(5, :origin => [user.lat, user.lng])

    render :json => @friends
  end

  def show
    @user = User.find_by(username: params[:username])
  end
end
