class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    # user = User.find(current_user.id)
    # target = User.find(params[:username])
    # params[:sender_id] = params[:sender_id]
    # params[:target_id] = params[:target_id]
    # params[:subject] = params[:title]
    # params[:content] = params[:body]
    params[:author] = current_user.username
    params[:read] = false
    Message.create!(message_params)
    # update the user messages count
    user = User.find(params[:target_id])
    messages = Message.where(target_id: user.id)
    user.count = messages.length
    user.save
    # message = Message.new(message_params)
    # message.author = current_user.username
    # message.save
    redirect_to '/'
  end

  def read
    message = Message.find(params[:id])
    message.read = true
    message.save
    redirect_to '/messages/show'
  end

  def show_all
    @messages = Message.where(target_id: current_user.id).reverse_order
  end

  def update

  end

  def reply
    @message = Message.find(params[:id])
    @user = User.find(@message.sender_id)
  end

  def delete
    messages = Message.where(target_id: current_user.id)
    user = User.find(current_user.id)
    message = Message.find(params[:id])
    message.delete
    user.count = messages.length
    user.save

    redirect_to '/messages/show'
  end

  private

  def message_params
    params.require(:sender_id)
    params.require(:target_id)
    params.require(:content)
    params.require(:author)
    params.require(:reciever)
    params.require(:read)
    params.permit(*%i[sender_id target_id subject content author reciever read])
  end
end
