class WorkoutsController < ApplicationController

  def new

  end

  def create
    params[:user_id] = current_user.id
    params[:author] = current_user.username
    Workout.create!(workout_params)
    redirect_to '/'
  end

  private


  # create_table "workouts", force: :cascade do |t|
  #   t.string   "title"
  #   t.text     "content"
  #   t.string   "date"
  #   t.integer  "user_id"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false

  def workout_params
    params.require(:title)
    params.require(:content)
    params.require(:date)
    params.require(:user_id)
    params.require(:author)
    params.permit(:title, :content, :date, :user_id, :author)
  end
end
