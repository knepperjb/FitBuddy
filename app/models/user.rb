class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :messages
  has_many :subscriptions
  has_many :workouts

  has_many :subscribed_to_me, class_name: "Subscription", foreign_key: :subscribee_id
  has_many :subscribers, through: :subscribed_to_me

  has_many :subscribing_to, class_name: "Subscription", foreign_key: :subscriber_id
  has_many :subscribees, through: :subscribing_to



  acts_as_mappable :default_units => :miles
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
