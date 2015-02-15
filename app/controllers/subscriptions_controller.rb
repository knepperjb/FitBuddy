class SubscriptionsController < ApplicationController
  def new

  end

  def create
    params[:subscriber_id] = current_user.id
    params[:subscribee_id] = params[:id]
    Subscription.create!(subscription_params)
    redirect_to '/'
  end

  def delete
    # subscription = Subscription.where(subscriber_id: current_user.id, subscribee_id: params[:id])
    subscription = Subscription.where("subscriber_id = ? and subscribee_id = ?", current_user.id, params[:id])
    subscription.destroy_all
    redirect_to '/'
  end

  private

  def subscription_params
    params.require(:subscriber_id)
    params.require(:subscribee_id)
    params.permit(:subscriber_id, :subscribee_id)
  end
end
