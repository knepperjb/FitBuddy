class UsersController < ApplicationController
  
  before_action :authenticate_user!
  def home
    @user = User.find(current_user.id)
    @unread_message_count = Message.where(target_id: @user.id, read: false).count
    subscriptions = Subscription.where(subscriber_id: @user.id)
    @workouts = []
    subscriptions.each do |s|
      workout = Workout.where(user_id: s.subscribee_id)
      @workouts.push(workout)
    end
    @workouts.flatten!
    @workouts.reverse!
  end

  def description
    @user = User.find(current_user.id)
  end

  def description_update
    user = User.find(current_user.id)
    user.description = params[:description]
    user.save
    redirect_to '/'
  end

  def set_experience
    user = User.find(current_user.id)
    user.level = params[:exp]
    user.save
    redirect_to '/'
  end

  def location
    @user = User.find(current_user.id)
  end

  def update
    user = User.find(params[:id])
    user.description = params[:description]
    byebug
    user.save
    redirect_to '/'
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
    @friends = User.within(20, :origin => [user.lat, user.lng])

    render :json => @friends
  end

  def show
    @user = User.find_by(username: params[:username])
    @workouts = Workout.where(user_id: @user.id)
  end

  def addimage
    user = User.find(current_user.id)
    user.image = params[:image]
    user.save
    redirect_to '/'
  end

  def search
    @user = User.find_by(username: params[:username])
  end

 
  def gravatar_link
    user = User.find(current_user.id)
    gravatar = Digest::MD5::hexdigest(user.email).downcase
    url = "http://gravatar.com/avatar/#{gravatar}.png?s=200"
    user.image = url
    user.save
    redirect_to '/'
  end

  private
  def user_params
    params.require(:description)
    params.permit(:description)
  end

end
